# Projeto Final -- Terraform + Ansible
#
# Thin wrappers around the shell plumbing the README used to spell out: the
# interpreter discovery for boto3, the public-IP lookup, the workspace switch.
# Nothing here hides a decision -- `make -n <target>` prints the exact commands.
#
# Terraform and Ansible stay two independent steps on purpose. `deploy-ENV`
# calls them in sequence; it does not couple them. See "A integração
# Terraform -> Ansible" in the README.
#
# Targets that take an environment read it from the target name:
#   make apply-dev      make configure-prod      make destroy-dev
# The terraform_data guard refuses anything other than dev and prod.

TF_DIR      := terraform
ANSIBLE_DIR := ansible
KEY         := $(HOME)/.ssh/projeto-final

# The Python that Ansible itself runs on. boto3 has to live there, not in
# whatever `python3` happens to resolve to first.
ANSIBLE_PY = $(shell ansible --version | sed -n 's/.*python version = .*(\(.*\))$$/\1/p')

.DEFAULT_GOAL := help

.PHONY: help check install-deps keypair vault bucket tfvars init validate \
        inventory url open unstick-ssh

help:  ## Lista os alvos disponíveis
	@echo "Projeto Final -- alvos disponíveis:"
	@echo ""
	@grep -E '^[a-zA-Z_%-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		  awk 'BEGIN {FS = ":.*?## "}; {printf "  %-16s %s\n", $$1, $$2}'
	@echo ""
	@echo 'Ambiente vai no nome do alvo: apply-dev, configure-prod, destroy-dev.'

# ---------------------------------------------------------------------------
# Preparação -- uma vez por máquina
# ---------------------------------------------------------------------------

check:  ## Confere ferramentas e credenciais AWS
	terraform version
	ansible --version | head -1
	aws --version
	aws sts get-caller-identity
	@# STS responde mesmo com a sessão do lab cancelada; a EC2 não.
	aws ec2 describe-regions --region us-east-1 > /dev/null && echo 'EC2 ok'

install-deps:  ## Instala as coleções e confere o boto3 no interpretador certo
	cd $(ANSIBLE_DIR) && ansible-galaxy collection install -r requirements.yml
	@echo "Ansible roda em: $(ANSIBLE_PY)"
	@"$(ANSIBLE_PY)" -c "import boto3, botocore; print('boto3 ok')" || { \
		  echo ""; \
		  echo "boto3 ausente NESSE interpretador. Instale com um dos dois:"; \
		  echo "  pipx inject ansible boto3 botocore"; \
		  echo "  $(ANSIBLE_PY) -m pip install boto3 botocore"; \
		  exit 1; }

keypair:  ## Gera o par de chaves SSH que o Terraform registra
	@test -f $(KEY) && echo "$(KEY) já existe, nada a fazer." || \
		  ssh-keygen -t ed25519 -f $(KEY) -N "" -C "projeto-final-iac"

vault:  ## Cria .vault_pass e um group_vars/all/vault.yml cifrado
	@test ! -f $(ANSIBLE_DIR)/.vault_pass || { \
		  echo ".vault_pass já existe. Apague-o antes se quiser recriar."; exit 1; }
	cd $(ANSIBLE_DIR) && openssl rand -base64 32 > .vault_pass && chmod 600 .vault_pass
	cd $(ANSIBLE_DIR) && rm -f group_vars/all/vault.yml && \
		  printf 'vault_app_admin_password: "%s"\n' "$$(openssl rand -base64 18)" | \
		  ansible-vault encrypt --output group_vars/all/vault.yml -
	@head -1 $(ANSIBLE_DIR)/group_vars/all/vault.yml

bucket:  ## Cria o bucket de state (BUCKET=tfstate-projeto-final-SEU-NOME)
	@test -n "$(BUCKET)" || { \
		  echo "Defina: make bucket BUCKET=tfstate-projeto-final-SEU-NOME"; exit 1; }
	aws s3api create-bucket --bucket "$(BUCKET)" --region us-east-1
	aws s3api put-bucket-versioning --bucket "$(BUCKET)" \
		  --versioning-configuration Status=Enabled
	aws s3api put-public-access-block --bucket "$(BUCKET)" \
		  --public-access-block-configuration \
		  "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true"
	aws s3api put-bucket-encryption --bucket "$(BUCKET)" \
		  --server-side-encryption-configuration \
		  '{"Rules":[{"ApplyServerSideEncryptionByDefault":{"SSEAlgorithm":"AES256"}}]}'

tfvars:  ## Escreve terraform.tfvars com o seu IP público (OWNER="Seu Nome")
	@test -n "$(OWNER)" || { echo 'Defina: make tfvars OWNER="Seu Nome"'; exit 1; }
	cd $(TF_DIR) && printf 'owner            = "%s"\nssh_ingress_cidr = "%s/32"\n' \
		  "$(OWNER)" "$$(curl -s https://checkip.amazonaws.com)" > terraform.tfvars
	@cat $(TF_DIR)/terraform.tfvars

init:  ## terraform init apontando para o seu bucket (BUCKET=...)
	@test -n "$(BUCKET)" || { echo "Defina: make init BUCKET=..."; exit 1; }
	cd $(TF_DIR) && terraform init -backend-config="bucket=$(BUCKET)"

# ---------------------------------------------------------------------------
# Ciclo de vida -- por ambiente
# ---------------------------------------------------------------------------

validate:  ## fmt, validate e syntax-check do playbook, tudo offline
	cd $(TF_DIR) && terraform fmt -check -recursive
	cd $(TF_DIR) && terraform validate
	cd $(ANSIBLE_DIR) && ansible-playbook --syntax-check site.yml

apply-%:  ## Provisiona a infraestrutura (apply-dev, apply-prod)
	cd $(TF_DIR) && terraform workspace select -or-create $*
	cd $(TF_DIR) && terraform apply

inventory:  ## Mostra os grupos que o inventário dinâmico descobriu
	cd $(ANSIBLE_DIR) && ansible-inventory --graph

configure-%:  ## Roda o playbook (configure-dev, configure-prod)
	cd $(ANSIBLE_DIR) && ansible-playbook site.yml --limit env_$*

deploy-%:  ## apply + inventory + configure, em passos independentes
	$(MAKE) apply-$*
	$(MAKE) inventory
	$(MAKE) configure-$*

destroy-%:  ## Destrói tudo do ambiente (destroy-dev, destroy-prod)
	cd $(TF_DIR) && terraform workspace select $*
	cd $(TF_DIR) && terraform destroy

# ---------------------------------------------------------------------------
# Depois do deploy
# ---------------------------------------------------------------------------

url:  ## Imprime as URLs da aplicação, prontas para clicar
	@cd $(TF_DIR) && echo "$$(terraform output -raw app_url)"
	@cd $(TF_DIR) && echo "$$(terraform output -raw app_url_dns)"

open:  ## Abre a aplicação no navegador
	@cd $(TF_DIR) && URL="$$(terraform output -raw app_url)"; \
		  if command -v explorer.exe >/dev/null; then explorer.exe "$$URL"; \
		  elif command -v open >/dev/null; then open "$$URL"; \
		  else xdg-open "$$URL"; fi

unstick-ssh:  ## Remove sockets ControlMaster mortos que travam o playbook
	rm -f $(HOME)/.ansible/cp/*
