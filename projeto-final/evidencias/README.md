# Evidências do Projeto Final

Saídas de terminal e capturas de tela da execução completa da entrega, na ordem
em que foram geradas. Os `.md` são saída de terminal capturada com
`tee`; os `.png` são capturas do navegador e do console da AWS.

Os comandos que produziram cada uma estão na
[Execução](../README.md#execução) do README do Projeto Final.

---

| # | Arquivo | O que prova |
| --- | --- | --- |
| 01 | [`evidencia_01-tf_fmt_validate_init_workspace_dev.png`](evidencia_01-tf_fmt_validate_init_workspace_dev.png) | `fmt`, `validate` e `init` limpos, workspace `dev` selecionado |
| 02 | [`evidencia_02-tf_apply_dev.md`](evidencia_02-tf_apply_dev.md) | 13 recursos criados em `dev` |
| 03 | [`evidencia_03-ansible_inventory_dynamic_dev.md`](evidencia_03-ansible_inventory_dynamic_dev.md) | O plugin descobriu a instância e gerou `role_docker_host` e `env_dev` |
| 04 | [`evidencia_04-ansible_playbook_dev.md`](evidencia_04-ansible_playbook_dev.md) | 1ª execução: `ok=9 changed=8` |
| 05 | [`evidencia_05-ansible_playbook_idempotencia_dev.md`](evidencia_05-ansible_playbook_idempotencia_dev.md) | **2ª execução: `ok=9 changed=0`** |
| 06 | [`evidencia_06-webapp_ip_dev.png`](evidencia_06-webapp_ip_dev.png) | Aplicação no navegador pelo IP, com um item na lista |
| 07 | [`evidencia_07-webapp_dns_dev.png`](evidencia_07-webapp_dns_dev.png) | A mesma aplicação pelo DNS público |
| 08 | [`evidencia_08-ssh_docker_ps_dev.png`](evidencia_08-ssh_docker_ps_dev.png) | `docker ps` no host, container em execução |
| 09 | [`evidencia_09-tf_workspace_prod.png`](evidencia_09-tf_workspace_prod.png) | Troca de workspace |
| 10 | [`evidencia_10-tf_apply_prod.md`](evidencia_10-tf_apply_prod.md) | 13 recursos criados em `prod` |
| 11 | [`evidencia_11-ansible_inventory_dynamic_prod.md`](evidencia_11-ansible_inventory_dynamic_prod.md) | Descoberta do host de `prod` |
| 12 | [`evidencia_12-ansible_playbook_prod_ssh_timeout.md`](evidencia_12-ansible_playbook_prod_ssh_timeout.md) | Tentativa que falhou por `sshd` ainda subindo — ver [Troubleshooting](../README.md#troubleshooting) |
| 13 | [`evidencia_13-ansible_playbook_prod.md`](evidencia_13-ansible_playbook_prod.md) | Execução completa em `prod` |
| 14 | [`evidencia_14-ansible_playbook_idempotencia_prod.md`](evidencia_14-ansible_playbook_idempotencia_prod.md) | **`ok=9 changed=0` em `prod`** |
| 15 | [`evidencia_15-webapp_ip_prod.png`](evidencia_15-webapp_ip_prod.png) | Aplicação de `prod` pelo IP |
| 16 | [`evidencia_16-webapp_dns_prod.png`](evidencia_16-webapp_dns_prod.png) | Aplicação de `prod` pelo DNS |
| 17 | [`evidencia_17-ssh_docker_ps_prod.png`](evidencia_17-ssh_docker_ps_prod.png) | Container rodando no host de `prod` |
| 18 | [`evidencia_18-s3_backend_workspaces.png`](evidencia_18-s3_backend_workspaces.png) | Os dois objetos de state lado a lado no bucket |
| 19 | [`evidencia_19-tf_destroy_prod.md`](evidencia_19-tf_destroy_prod.md) | `Destroy complete! Resources: 13 destroyed` |
| 20 | [`evidencia_20-tf_destroy_dev.md`](evidencia_20-tf_destroy_dev.md) | `Destroy complete! Resources: 13 destroyed` |
| 21 | [`evidencia_21-ansible_vault_cifrado.md`](evidencia_21-ansible_vault_cifrado.md) | Vault cifrado, consumido por indireção e com a senha fora do Git |

> O IP residencial do operador aparece como `203.0.113.42/32` (RFC 5737) e o
> ID da conta como `123456789012`. O que a evidência prova — porta 22 restrita
> a um único `/32` — não muda.

---

← Voltar para o [README do Projeto Final](../README.md).
