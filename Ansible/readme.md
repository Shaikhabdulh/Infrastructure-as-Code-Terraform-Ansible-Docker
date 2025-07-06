# Ansible Nginx Deployment

This project uses Ansible to deploy a basic Nginx web server and serve a static HTML page.

## 📁 Project Structure

<pre> Ansible/ ├── files/ │ └── index.html # Static webpage to be served ├── inventory # Ansible inventory file with target hosts ├── nginx_playbook.yml # Main playbook to install and configure Nginx └── vault.yml # Encrypted file containing secrets (Ansible Vault) </pre>

## 🔧 Requirements

- Ansible installed (`pip install ansible`)
- SSH access to target hosts
- Properly configured `inventory` file
- Vault password (if `vault.yml` is used)

## 🚀 Usage

1. **Run the playbook**:

```bash
ansible-playbook -i inventory nginx_playbook.yml


ansible-playbook -i inventory nginx_playbook.yml --ask-vault-pass
<!--
## About Ansible Vault

**Ansible Vault** lets you encrypt sensitive data (like passwords or keys) in your Ansible files.  
Use it to keep secrets safe in playbooks or variable files, especially when sharing code or using version control.
I am using vault to store ssh and sudo user password.
-->
<!--
## About Ansible Vault
**My Ansible Vault Password Admin@123**  
-->
ansible-vault edit vault.yml
ansible-vault view vault.yml

📄 License
This project is licensed under the MIT License.

Let me know if you want it customized for multiple roles or environments.
