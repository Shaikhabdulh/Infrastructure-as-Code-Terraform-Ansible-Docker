# 🌐 Terraform VPC Setup with Remote Backend

This project sets up an AWS Virtual Private Cloud (VPC) using Terraform and stores the Terraform state remotely in an S3 bucket for collaboration and consistency.

---

## 📁 Project Structure

```

terraform/
├── .terraform.lock.hcl     # Dependency lock file
├── backend.tf              # Remote backend configuration (S3)
├── provider.tf             # AWS provider configuration
└── vpc.tf                  # VPC module configuration
````
---
## 🔍 What Each File Does
### ✅ `provider.tf`
- **Purpose**: Sets the default AWS provider and region.
- **Why**: Terraform needs to know where and how to connect to your AWS environment.
- **How**: Uses AWS CLI profile (`default`) and region (`us-east-1`).
### ✅ `backend.tf`
- **Purpose**: Configures remote state storage using an **S3 bucket**.
- **Why**: Remote state allows collaboration, state locking, and shared infrastructure state tracking.
- **How**:
  - Bucket: `terraform-my-bucket1`
  - Path: `devops/terraform.tfstate`
  - Locking: Enabled with S3's internal locking mechanism.
> 🔐 Ensure the S3 bucket exists and versioning is enabled. Use DynamoDB for enhanced locking if needed.
### ✅ `vpc.tf`
- **Purpose**: Defines the required provider version and default region.
- **How**: Uses HashiCorp AWS provider (recommended approach).
---
## 🌍 When to Use Remote Backend (S3)
| Environment      | Use Remote Backend? | Reason                                                                 |
|------------------|---------------------|------------------------------------------------------------------------|
| **Dev (team)**   | ✅ Yes               | Enables team collaboration, consistent state, and locking              |
| **Stage / QA**   | ✅ Yes               | Ensures consistency with production, allows shared state               |
| **Production**   | ✅ Absolutely Yes    | Critical for preventing drift, managing access, and ensuring stability |
| **Dev (solo)**   | 🚫 Optional          | Local backend may be fine, but remote is better if repo is shared      |
| **Test / Demo**  | 🚫 No                | Temporary or experimental setups can use local state                   |
---
## 🔧 Requirements
- Terraform v1.3 or later
- AWS CLI installed and configured (`aws configure`)
- An existing S3 bucket (`terraform-my-bucket1`)
- (Optional) DynamoDB table for state locking (recommended for team use)
---
## 🚀 How to Use
1. **Clone the repository**:
  ```bash
   git clone <repo-url>
   cd terraform/
  ```
2. **Initialize Terraform** (downloads modules and sets up backend):
   ```bash
   terraform init
   ```
3. **Plan the infrastructure**:
   ```bash
   terraform plan
   ```
4. **Apply the configuration**:
  ```bash
   terraform apply
  ```
---
## 🧹 Clean Up
To destroy all resources:
```bash
terraform destroy
```
---
## 📦 Backend Setup Tips
To prepare your backend:
1. **Create an S3 bucket**:
   ```bash
   aws s3api create-bucket --bucket terraform-my-bucket1 --region us-east-1
   ```
2. **Enable versioning** (for backup and state history):
   ```bash
   aws s3api put-bucket-versioning --bucket terraform-my-bucket1 --versioning-configuration Status=Enabled
   ```
3. *(Optional but recommended)* **Create DynamoDB for locking**:
   ```bash
   aws dynamodb create-table \
     --table-name terraform-locks \
     --attribute-definitions AttributeName=LockID,AttributeType=S \
     --key-schema AttributeName=LockID,KeyType=HASH \
     --billing-mode PAY_PER_REQUEST
   ```
   ---
## 📄 License
This project is licensed under the MIT License.
