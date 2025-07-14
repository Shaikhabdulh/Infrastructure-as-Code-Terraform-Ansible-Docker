### 📦 Static Website Deployment to AWS S3 using Ansible

## 📚 Overview

This project automates the process of syncing static HTML content to an Amazon S3 bucket using Ansible. It enables teams or individuals to deploy, manage, and update static websites efficiently and reliably.

---

## ❓ Why This Project?

Deploying static websites manually to S3 can be time-consuming and error-prone. This solution:

- Automates deployment via Ansible
- Ensures repeatable and consistent uploads
- Supports version control for deployment configuration
- Reduces human error

---

## 📁 Folder Structure

```

.
├── Sites/                # Directory for local static website files (HTML/CSS/JS)
├── requirements.yml      # Lists Ansible collections/roles required for the project
└── sync\_to\_s3.yml        # Main Ansible playbook to sync content to the S3 bucket

````

---

## ⚙️ Prerequisites

Before using this project, ensure the following:

- ✅ Python 3.x installed
- ✅ Ansible installed (`pip install ansible`)
- ✅ AWS CLI configured with valid credentials (`aws configure`)
- ✅ S3 bucket already created and accessible

---

## 🧩 What Each File Does

- **Sites/**:  
  Contains one or more folders representing static websites to be uploaded to S3. You can place your HTML/CSS/JS content here.

- **requirements.yml**:  
  Ansible dependencies. Run this to install necessary roles or collections.
  ```bash
  ansible-galaxy install -r requirements.yml
  ````
**sync\_to\_s3.yml**:
  The Ansible playbook that automates syncing files to the specified S3 bucket.
---

### 🚀 How to Use

### Step 1: Clone this repository

```bash
git clone <your-repo-url>
cd <your-repo-directory>
```

### Step 2: Install Ansible dependencies

```bash
ansible-galaxy install -r requirements.yml
```

### Step 3: Configure your variables

Update `sync_to_s3.yml` with your target S3 bucket name and region.

### Step 4: Run the playbook

```bash
ansible-playbook sync_to_s3.yml
```

---

## 🧠 Where It Deploys

* Static files from the `Sites/` directory are uploaded to:

  ```
  s3://your-bucket-name/
  ```

* Make sure your S3 bucket is **publicly accessible** (or configured for CloudFront or static hosting).

---

## 📌 Use Cases

* Hosting portfolio websites
* Internal documentation portals
* Rapid prototyping of frontend applications

---

## 🔒 Security Note

* Never upload sensitive data (e.g., `.env`, credentials) to S3.
* Enable versioning and access control on your S3 bucket.

---
