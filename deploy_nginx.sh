#!/bin/bash

# Exit on any error
set -e

# Step 1: Provision EC2 and Security Group
echo "🔧 Applying Terraform to provision EC2 instance..."
cd "Managing EC2 & SG With Terraform"
terraform apply -auto-approve

# Step 2: Generate dynamic Ansible inventory
echo "📝 Creating Ansible inventory with EC2 public IP..."
EC2_IP=$(terraform output -raw ec2_public_ip)
cd ../Ansible
echo -e "[web]\n$EC2_IP" > inventory

# Step 3: Run Ansible Playbook
echo "🚀 Running Ansible playbook to install NGINX..."
ansible-playbook -i inventory nginx_playbook.yml
echo "✅ NGINX installed and running on http://$EC2_IP"

# Step 4: Cleanup inventory
rm -f inventory
cd ..

# Step 5: (Optional) Destroy infrastructure
read -p "🧨 Do you want to destroy the EC2 instance now? (y/n): " CONFIRM
if [[ "$CONFIRM" == "y" ]]; then
    cd "Managing EC2 & SG With Terraform"
    terraform destroy -auto-approve
    cd ..
    echo "🗑️ Infrastructure destroyed successfully."
else
    echo "⚠️ EC2 instance retained. You can manually destroy later using Terraform."
fi

# Final messages
echo "✅ Script completed successfully."
echo "🌐 Access NGINX at: http://$EC2_IP"
echo "📘 For more details, visit the project repo:"
echo "🔗 https://github.com/Shaikhabdulh/Infrastructure-as-Code-Terraform-Ansible-Docker/"
echo "🎉 Thank you for using this automation script!"
# End of script