# 🛠️ NGINX Setup with Fakebook Landing Page (Bash Script)
This script automates the installation and configuration of an NGINX web server and deploys a simple Facebook-style HTML landing page called **Fakebook**.
---
## 📌 Purpose
- **Why this script?**
  - To quickly deploy a lightweight mock login page for demos, UI mockups, or educational purposes.
  - Automates NGINX setup and static HTML deployment with minimal effort.
---
## 🧪 Use Cases
| Environment | Use It? | Reason                                                                 |
|-------------|---------|------------------------------------------------------------------------|
| **Local VM**         | ✅ Yes   | Quick testing or learning environment                                |
| **Dev/QA servers**   | ✅ Yes   | To simulate UI or HTTP services in internal apps                      |
| **Public cloud**     | ⚠️ Maybe | Only for educational/demo purposes (ensure you are not misleading users) |
| **Production**       | ❌ No    | Not intended for real-world auth or security-critical scenarios       |
---
## 🧭 Target Systems
- Amazon Linux 2 (EC2)
- RHEL/CentOS (uses `yum`)
- Any system with:
  - `yum` package manager
  - Systemd service manager (`systemctl`)
  - Root or sudo permissions
---
## ⚙️ What the Script Does
1. Updates the system using `yum update`
2. Installs NGINX
3. Enables and starts NGINX service
4. Overwrites the default NGINX homepage with a custom HTML file simulating a **Fakebook login page**
---
## 📂 File: `setup_fakebook.sh`
```bash
#!/bin/bash
# Update the system
yum update -y
# Install NGINX
yum install -y nginx
# Start and enable NGINX
systemctl start nginx
systemctl enable nginx
# Create a basic Facebook-like homepage
cat > /usr/share/nginx/html/index.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Fakebook</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #e9ebee;
            margin: 0;
            padding: 0;
        }
        .header {
            background: #3b5998;
            color: white;
            padding: 15px;
            text-align: center;
            font-size: 24px;
            font-weight: bold;
        }
        .container {
            margin: 50px auto;
            width: 300px;
            background: white;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
        }
        .container h2 {
            text-align: center;
            color: #3b5998;
        }
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        button {
            background: #3b5998;
            color: white;
            padding: 10px;
            width: 100%;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background: #2d4373;
        }
    </style>
</head>
<body>
    <div class="header">Fakebook</div>
    <div class="container">
        <h2>Login</h2>
        <form>
            <input type="text" placeholder="Email or Phone">
            <input type="password" placeholder="Password">
            <button type="submit">Log In</button>
        </form>
    </div>
</body>
</html>
EOF
````

---
## 🚀 How to Use
1. **Launch a Linux server (e.g., AWS EC2 with Amazon Linux or CentOS)**
2. **Connect via SSH**
3. **Run the script**:
   ```bash
   chmod +x setup_fakebook.sh
   sudo ./setup_fakebook.sh
   ```
4. **Visit your server's IP** in a browser:
   ```
   http://<your-server-public-ip>
   ```
---
## ⚠️ Disclaimer

* **This is for demo/testing/educational purposes only.**
* Never use "Fakebook" or similar clones to collect real user data.
* Do not deploy such mock pages publicly without user consent.
---
