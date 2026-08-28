# CESAR School · Pós DevOps · Infraestrutura como Código

Repositório das entregas avaliativas da disciplina de **Infraestrutura como
Código (IaC) e Gerenciamento de Configuração**, da especialização em DevOps da
CESAR School.

São duas entregas, cada uma em seu próprio diretório, com código, evidências,
documentação e state remoto separados. Este arquivo é só o índice: a
documentação completa de cada entrega — arquitetura, passo a passo, decisões e
troubleshooting — vive no README do diretório correspondente.

![Terraform](https://img.shields.io/badge/Terraform-844FBA?style=flat-square&logo=terraform&logoColor=white)
![Ansible](https://img.shields.io/badge/Ansible-EE0000?style=flat-square&logo=ansible&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?style=flat-square&logo=docker&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-232F3E?style=flat-square&logo=amazonwebservices&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green?style=flat-square)

---

## Entregas

### [Projeto Final — Terraform + Ansible](projeto-final/README.md)

Provisionamento e configuração integrados: o Terraform entrega uma VPC e uma
EC2 crua; o Ansible instala o Docker Engine e sobe o container da aplicação
[`getting-started-app`](https://github.com/docker/getting-started-app) na porta
3000. A ligação entre as duas ferramentas é o **inventário dinâmico**
`amazon.aws.aws_ec2`, que descobre a instância pelas tags que o Terraform
aplicou.

📄 [`projeto-final/README.md`](projeto-final/README.md) ·
💻 [`projeto-final/`](projeto-final/) ·
📸 [`projeto-final/evidencias/`](projeto-final/evidencias/)

### [Atividade 1 — Terraform na AWS](atividade-1/README.md)

Provisionamento da infraestrutura mínima para hospedar uma página web: VPC
própria, subnet pública, Internet Gateway, Security Group e uma EC2 servindo
HTML via `httpd`, com state remoto no S3 e os ambientes `dev` e `prod`. Os
módulos desta entrega são a base que o Projeto Final reaproveitou.

📄 [`atividade-1/README.md`](atividade-1/README.md) ·
💻 [`atividade-1/`](atividade-1/) ·
📸 [`atividade-1/evidencias/`](atividade-1/evidencias/) ·
🏷️ tag [`entrega-atividade-1`](https://github.com/weynne/cesar-school-pos-devops-iac/releases/tag/entrega-atividade-1)

> A seção
> [Da Atividade 1 ao Projeto Final](projeto-final/README.md#da-atividade-1-ao-projeto-final)
> registra o que foi herdado inteiro, o que foi adaptado e o que nasceu na
> segunda entrega.

---

## Estrutura do repositório

```
.
├── atividade-1/                # Terraform: VPC + EC2 servindo uma página web
│   ├── README.md               # documentação completa da entrega
│   ├── *.tf                    # raiz da configuração
│   ├── modules/                # network + web-server
│   └── evidencias/
├── projeto-final/              # Terraform + Ansible: VPC + EC2 + container
│   ├── README.md               # documentação completa da entrega
│   ├── terraform/              # provisiona a infraestrutura
│   ├── ansible/                # configura o que roda dentro dela
│   └── evidencias/
├── LICENSE
└── README.md                   # este índice
```

Cada entrega tem a sua própria raiz de Terraform e o seu próprio objeto de
state no S3. Nenhuma delas lê o state da outra: o reaproveitamento entre as
duas foi de **código**, copiando os módulos, não de infraestrutura.

---

## O que as duas entregas têm em comum

| Aspecto | Nas duas entregas |
| --- | --- |
| **Conta AWS** | AWS Academy Learner Lab, região `us-east-1`. As credenciais expiram em 3 a 4 horas e trazem **três** valores, incluindo o `aws_session_token` |
| **State** | Backend S3 com versionamento, criptografia em repouso e lock nativo (`use_lockfile`, Terraform ≥ 1.10). Sem DynamoDB |
| **Ambientes** | Workspaces `dev` e `prod`, com CIDR e nomes derivados de `terraform.workspace` |
| **Tags** | Aplicadas a todo recurso taggável via `default_tags`, em inglês |
| **Idioma** | Código, nomes e comentários em **inglês**; documentação em **português** |
| **Commits** | [Conventional Commits](https://www.conventionalcommits.org/pt-br/), com escopo por componente |
| **Evidências** | Saídas de terminal em `.md` e capturas em `.png`, numeradas na ordem em que foram geradas, com IP residencial e ID de conta redigidos |

> [!IMPORTANT]
> O `backend.tf` de cada entrega aponta para um bucket que **não é acessível de
> fora**. Para reproduzir qualquer uma delas você precisa criar o seu próprio
> bucket e passá-lo por `-backend-config`. O passo a passo está no README da
> entrega.

---

## Por onde começar

Cada README abre com um **Início rápido**: o caminho mais curto do clone até a
infraestrutura no ar, com todos os comandos prontos e sem explicação no meio.
Depois dele vêm as seções que explicam cada decisão, o passeio arquivo por
arquivo e o troubleshooting.

- [Início rápido do Projeto Final](projeto-final/README.md#início-rápido)
- [Início rápido da Atividade 1](atividade-1/README.md#início-rápido)

---

## Créditos

Disciplina de **Infraestrutura como Código (IaC) e Gerenciamento de Configuração**,
ministrada por **Cris Apolinário**, na especialização em DevOps da CESAR School.

Autoria: **Weynne Guimarães** · [wjgcl@cesar.school](mailto:wjgcl@cesar.school)

Distribuído sob a licença [MIT](LICENSE).
