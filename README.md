# 📚 Internal Store Wiki — README

## 📝 Project Overview

A simple internal wiki for store staff, designed to help reduce unnecessary IT support tickets by giving store employees a clear, easy-to-use knowledge base. This project demonstrates IaC with Terraform, configuration management with Ansible, and containerisation with Docker.

## ⚙️ What This Project Uses

- **Terraform** — to provision the underlying infrastructure (EC2 instance, security groups, etc.).
- **Ansible** — to configure and deploy the Flask application onto the server automatically.
- **Docker** — to containerise the Flask app so it runs consistently across environments.

## 📂 Project Structure

```
project-1-internal-wiki/
│   ├── main.tf               # Terraform configuration
│   ├── outputs.tf
│   ├── terraform.tfstate
│   ├── .terraform.lock.hcl
│   ├── playbook.yml          # Ansible playbook to configure EC2 and deploy app
│   ├── app.py                # Simple Flask wiki app
│   ├── Dockerfile            # Container definition for Flask app
│   ├── inventory.ini         # Ansible inventory file
│   └── devops-key-v2.pem     # SSH key (DO NOT commit this in production!)
```

## 🚀 How To Deploy & Test

### 1️⃣ Provision Infrastructure

1. Install [Terraform](https://developer.hashicorp.com/terraform/install) and configure your AWS credentials.
2. Initialise and apply:
   ```bash
   terraform init
   terraform apply
   ```
3. Take note of the output (public IP address).

### 2️⃣ Configure & Deploy with Ansible

1. Install [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html).
2. Update `inventory.ini` with your EC2 instance IP.
3. Run the playbook:
   ```bash
   ansible-playbook -i inventory.ini playbook.yml
   ```

### 3️⃣ Build & Run with Docker

1. SSH into your EC2 instance.
2. Build your image:
   ```bash
   docker build -t internal-wiki .
   ```
3. Run the container:
   ```bash
   docker run -d -p 5000:5000 internal-wiki
   ```

### ✅ Verify

Visit `http://<your-ec2-ip>:5000` to confirm the wiki is up and accessible.

## 🔒 Notes

- Never commit sensitive files (e.g., `.pem` keys) to a public repo.
- Tweak your security groups to allow HTTP/HTTPS traffic to your instance.

---

This project shows how you can combine Terraform, Ansible, and Docker for a simple, repeatable deployment process

