# 🗂️ Internal Store Wiki — DevOps Project

## 📌 Project Overview

This project demonstrates an end-to-end DevOps workflow for deploying an internal wiki Flask application to an AWS EC2 instance. 
It’s an extremely simple app (kind of like "Hello World") that will eventually be developed further. 
It’s designed to reduce unnecessary IT support tickets by providing store staff with self-service documentation.

---

## 🚀 Tech Stack

- **Python Flask** — Internal wiki web app  
- **Docker + Docker Compose** — Containerised Flask + Nginx reverse proxy  
- **Terraform** — Provision AWS EC2 infrastructure  
- **Ansible** — Configure server, deploy app with Docker Compose  
- **GitHub Actions** — CI/CD pipeline to automate deployments on `git push`  

---

## 🗃️ Project Structure

```
.
├── flask_app/
│   ├── Dockerfile
│   ├── app.py
│   ├── docker-compose.yml
│   └── nginx/default.conf
├── internal-wiki-devops/terraform/
│   ├── main.tf
│   ├── outputs.tf
│   └── terraform.lock.hcl
├── inventory.ini
├── playbook.yml
├── .github/workflows/deploy.yml
└── README.md

```

✅ **Key files:**  
- `main.tf` — provisions EC2 instance and SSH key pair  
- `inventory.ini` — defines Ansible hosts (replace with your own IP)  
- `playbook.yml` — installs Docker & runs Flask app via Compose  
- `deploy.yml` — GitHub Actions pipeline for auto-deploy to EC2

---

## ⚙️ How It Works

1. **Infrastructure:**  
   - Run `terraform apply` to spin up your EC2 instance.  
   - Outputs the public IP you’ll SSH into.

2. **Configuration:**  
   - Update `inventory.ini` with your EC2 IP.  
   - Use your own `.pem` key (not included for security).

3. **Deployment:**  
   - GitHub Actions workflow connects via SSH & runs Ansible.  
   - Ansible sets up Docker, pulls the app, runs Compose with Nginx.

4. **Access:**  
   - Wiki app served via Nginx reverse proxy on port `80`.

---

## 🔒 Important Notes

- **No `.pem` file** included — add your own SSH key & keep it out of version control.
- **Hardcoded IP** — you’ll need to update `inventory.ini` to match your EC2.
- **Secrets** — store your `EC2_SSH_KEY` and `EC2_PUBLIC_IP` in GitHub Actions secrets.

---

## 📖 What I Learnt

✅ IaC with Terraform  
✅ Server config with Ansible  
✅ Docker orchestration with Compose & Nginx  
✅ CI/CD automation with GitHub Actions  
✅ Best practices for securing keys & infra

---

**Feel free to fork, adapt, or get in touch if you’d like to discuss improvements!**


