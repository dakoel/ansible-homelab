# ansible-homelab

## Usage

To execute a playbook use:

```console
ansible-playbook -i <path_to_inventory> <name_of_playbook.yml> --vault-pass-file <path_to_vault_pass>
```

## Create new certificate for sealed-secrets

```console
openssl req -x509 -days 3650 -nodes -newkey rsa:4096 -keyout sealed-secrets.key -out sealed-secrets.crt -subj "/CN=sealed-secrets/O=sealed-secrets"
ansible-vault encrypt --vault-password-file <path_to_vault_pass> sealed-secrets.key
ansible-vault encrypt --vault-password-file <path_to_vault_pass> sealed-secrets.crt
```
