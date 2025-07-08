# 🚀 Terraform & Ansible Infrastructure Lab

This project demonstrates modern **Infrastructure as Code (IaC)** using **Terraform**, **Ansible**, and **Shell scripting** to provision and configure AWS infrastructure — from EC2 instances to VPCs, S3 static sites, and NGINX deployment with a mock UI page.

---

## 📁 Project Structure

```
.
├── Ansible/                                # NGINX deployment using Ansible
├── Managing EC2 & SG With Terraform/       # EC2 instance and security group setup
├── S3 Static Website Hosting With Terraform/ # Static site hosting via S3 and Terraform
├── Terraform_Remote_Backend/               # VPC creation with remote state backend (S3)
├── User_Data/                              # Shell script to auto-configure EC2 with HTML UI
├── deploy_nginx.sh                         # Full automation script (Terraform + Ansible)
├── .gitignore
└── readme.md
```

---

## 📦 Modules / Folders Explained

| Folder                                      | Purpose                                                              |
| ------------------------------------------- | -------------------------------------------------------------------- |
| `Ansible/`                                  | Configures web server and deploys a static HTML file using Ansible   |
| `Managing EC2 & SG With Terraform/`         | Provisions EC2 with SSH & HTTP access and generates SSH key          |
| `S3 Static Website Hosting With Terraform/` | Hosts a public static website using S3 and Terraform                 |
| `Terraform_Remote_Backend/`                 | Creates VPC using module and stores state remotely (S3 backend)      |
| `User_Data/`                                | Bash script to install NGINX and deploy a mock "Fakebook" login page |
| `deploy_nginx.sh`                           | One-click deployment: Terraform EC2 + Ansible NGINX setup            |

---

## 🧰 Tech Stack

* **Terraform** – Provision AWS infrastructure
* **Ansible** – Automate server setup (like installing NGINX)
* **Shell Script** – Rapid custom setup for EC2
* **AWS** – Cloud platform (EC2, S3, VPC)
* **NGINX** – Web server to serve static content
* **HTML/CSS** – Frontend mock login page

---

## ⚙️ Setup Instructions

### 🔹 EC2 + Security Group

```bash
cd "Managing EC2 & SG With Terraform"
terraform init
terraform apply
```

### 🔹 Remote VPC with S3 Backend

```bash
cd "Terraform_Remote_Backend"
terraform init
terraform apply
```

> 🔐 Make sure S3 bucket and DynamoDB table exist before initializing remote backend.

### 🔹 Ansible NGINX Deployment

```bash
cd Ansible
ansible-playbook -i inventory nginx_playbook.yml
# If vault is used:
ansible-playbook -i inventory nginx_playbook.yml --ask-vault-pass
```

### 🔹 User Data Script (Fakebook Setup)

```bash
cd User_Data
chmod +x setup_fakebook.sh
sudo ./setup_fakebook.sh
```

Then visit: `http://<EC2-IP>`

---

### 🔹 S3 Static Website Hosting

```bash
cd "S3 Static Website Hosting With Terraform"
terraform init
terraform apply
```

> Make sure the bucket name is globally unique.
> The output will show a public S3 website URL. Visit it to confirm the `index.html` loads with the message:
> **“Hi, S3 is working”**

---

## 🔄 Full Automation Script (Terraform + Ansible)

```bash
chmod +x deploy_nginx.sh
./deploy_nginx.sh
```

This script will:

* Apply Terraform to spin up EC2
* Extract EC2 public IP
* Create inventory for Ansible
* Deploy NGINX with Ansible
* Prompt for cleanup (`terraform destroy`)

---

## ❓ When & Why to Use Each Folder

| Folder                                      | When to Use                         | Why It’s Useful                                            |
| ------------------------------------------- | ----------------------------------- | ---------------------------------------------------------- |
| `Ansible/`                                  | After provisioning                  | Installs packages like NGINX, pushes HTML config           |
| `Managing EC2 & SG With Terraform/`         | Need EC2 and key-based access setup | Creates instance and security group from scratch           |
| `S3 Static Website Hosting With Terraform/` | Host static website content         | Fast and cheap way to publish static content globally      |
| `Terraform_Remote_Backend/`                 | Production/team environments        | Stores state in S3 for collaboration, adds locking support |
| `User_Data/`                                | Quick demo/mock login UI setup      | Lightweight NGINX + Fakebook-like page via Bash script     |

---

## 🧠 Best Practices

* 🔐 Store secrets in **Ansible Vault**
* ✅ Use **Terraform remote backend (S3 + DynamoDB)** for team/production use
* 🧪 Always run `terraform plan` before `apply`
* 🔒 Secure private keys (e.g., `chmod 400`)
* 🧼 Clean up resources after demo using `terraform destroy`

---

## 🧩 Project Goals

* Automate infra + software setup
* Learn end-to-end IaC workflow
* Modularize deployment by separating responsibilities
* Showcase real-world DevOps stack

---

## 🖼️ Diagrams / Screenshots

### EC2 Security Group

![EC2 Security Group](./Managing%20EC2%20%26%20SG%20With%20Terraform/ec2-sg.png)

### Infrastructure Overview

![Infrastructure Overview](./Managing%20EC2%20%26%20SG%20With%20Terraform/infrastructure.png)

---

## 📜 License

This repository is licensed under the **MIT License**.
Feel free to use, adapt, and contribute.

---

## 🔗 GitHub Project Link

[GitHub Repository](https://github.com/Shaikhabdulh/Infrastructure-as-Code-Terraform-Ansible-Docker)

---

Let me know if you'd like to:

* Add a `Makefile` for automation
* Set up GitHub Actions for CI/CD
* Include regional variables for multi-env support (`dev`, `prod`, etc.)
