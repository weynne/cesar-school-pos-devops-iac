$ head -1 group_vars/all/vault.yml
$ANSIBLE_VAULT;1.1;AES256

$ grep -r vault_app_admin_password group_vars/all/vars.yml
group_vars/all/vars.yml:app_admin_password: "{{ vault_app_admin_password }}"

$ grep -n 'app_admin_password\|no_log' roles/app/tasks/main.yml
35:# no_log because the vault password is passed as an environment variable:
47:      APP_ADMIN_PASSWORD: "{{ app_admin_password }}"
48:  no_log: true

$ git check-ignore -v .vault_pass
.gitignore:51:.vault_pass	.vault_pass
