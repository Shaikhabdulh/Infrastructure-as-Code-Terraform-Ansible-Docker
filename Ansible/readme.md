```md
# Ansible Nginx Deployment

This project uses Ansible to deploy a basic Nginx web server and serve a static HTML page.

## 📁 Project Structure

```

Ansible/
├── files/
│   └── index.html            # Static webpage to be served
├── inventory                 # Ansible inventory file with target hosts
├── nginx\_playbook.yml        # Main playbook to install and configure Nginx
└── vault.yml                 # Encrypted file containing secrets (Ansible Vault)

````

## 🔧 Requirements

- Ansible installed (`pip install ansible`)
- SSH access to target hosts
- Properly configured `inventory` file
- Vault password (if `vault.yml` is used)

## 🚀 Usage

Run the playbook:

```bash
ansible-playbook -i inventory nginx_playbook.yml
````

If using Ansible Vault:

```bash
ansible-playbook -i inventory nginx_playbook.yml --ask-vault-pass
```

## 🔐 Ansible Vault

Ansible Vault is used to encrypt sensitive data like passwords or SSH credentials.

To edit or view the vault file:

```bash
ansible-vault edit vault.yml
ansible-vault view vault.yml
```

> 💡 **Never share your vault password publicly.**

## 📄 License

This project is licensed under the MIT License.
