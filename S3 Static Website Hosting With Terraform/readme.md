## 🌐 S3 Static Website Hosting With Terraform

This project provisions an **Amazon S3 bucket** and configures it for **static website hosting** using **Terraform**. It uploads a simple `index.html` page to demonstrate a working setup.

---

### 🗂️ Project Structure

```
.
├── index.html              # The static web page
├── main.tf                 # Terraform configuration
├── terraform.tfstate       # Terraform state file (auto-generated)
├── terraform.tfstate.backup
└── .terraform.lock.hcl     # Provider lock file (auto-generated)
```

---

### 🚀 What This Terraform Code Does

* Creates an S3 bucket
* Enables **static website hosting**
* Enables **versioning**
* Uploads a local `index.html` file to the bucket
* Outputs the website's public URL

---

### 📄 index.html Content

```html
<!DOCTYPE html>
<html>
  <head><title>S3 Website</title></head>
  <body><h1>Hi, S3 is working</h1></body>
</html>
```

---

### 🛠️ How to Use

1. **Initialize Terraform**

   ```bash
   terraform init
   ```

2. **Apply the Configuration**

   ```bash
   terraform apply
   ```

3. **Access the Website**

   After apply, you'll see an output like:

   ```
   website_url = "http://your-bucket-name.s3-website-region.amazonaws.com"
   ```

   Open this URL in your browser.

---

### 🧹 Cleanup

To destroy the resources:

```bash
terraform destroy
```

---

### 📌 Notes

* Bucket name must be globally unique
* No ACLs used — compatible with AWS provider `v6+`
* Public access is controlled via S3 settings (no bucket policy included here for simplicity)

---
