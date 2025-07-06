# 🚀 Terraform AWS EC2 & Security Group Setup

This project provisions an EC2 instance on AWS using Terraform, with an automatically generated SSH key and a security group allowing SSH and HTTP access.
---

## 📁 Project Structure
```
terraform/
├── EC2 & SG.tf           # Main Terraform configuration
├── ec2-sg.dot            # DOT format graph of EC2 & SG resources
├── ec2-sg.png            # Visual graph of EC2 & SG
├── infra.dot             # DOT graph of entire infrastructure
└── infrastructure.png    # Infrastructure diagram
````

---
## ⚙️ What It Does
1. **Generates an SSH Key Pair**
2. **Creates a Security Group** that allows:
   - Port 22 (SSH)
   - Port 80 (HTTP)
3. **Launches an EC2 Instance**
   - AMI: `ami-05ffe3c48a9991133`
   - Type: `t2.micro`
4. **Outputs Private Key** for local use (hidden from normal output)
---

## 🔧 Requirements
- [Terraform v1.3+](https://www.terraform.io/downloads.html)
- AWS CLI configured (`aws configure`)
- AWS account with EC2 permissions

---

## 🚀 How to Use
1. **Clone the repo & move to directory**
  ```bash
   git clone <repo-url>
   cd terraform
  ````
2. **Initialize Terraform**
   ```bash
   terraform init
   ```
3. **Plan your infrastructure**
   ```bash
   terraform plan
   ```
4. **Apply the changes**
   ```bash
   terraform apply
   ```
5. **Save the private key (optional)**
   ```bash
   terraform output -raw private_key_pem > mykey.pem
   chmod 400 mykey.pem
   ```
---

## 📉 Visual Diagrams

* `ec2-sg.png`: EC2 & Security Group relationship
* `infrastructure.png`: Full architecture overview

Generated using:

```bash
terraform graph | dot -Tpng > infrastructure.png
```

---

## 🧹 Clean Up

To destroy all resources:

```bash
terraform destroy
```

---

## 📄 License

MIT License. Use at your own risk.

```
Let me know if you'd like to include Ansible integration or move this to a multi-environment setup.
```
