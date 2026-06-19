# DevOps Rescue Lab

A complete end-to-end DevOps project demonstrating cloud infrastructure provisioning, configuration automation, and application deployment using Terraform, Ansible, and AWS.

This project simulates a real-world production workflow:
**Infrastructure → Configuration → Deployment → Cleanup**

---

# 📸 Project Screenshots

Add screenshots here:

- Terraform apply success
- EC2 instance running
- Ansible Nginx installation
- Browser access to web server

---

# 🏗️ Architecture Overview
User
↓
Internet
↓
EC2 Instance (Ubuntu + Nginx Web Server)
↓
Security Group (Firewall Rules)
↓
Public Subnet
↓
Route Table
↓
Internet Gateway
↓
VPC (10.0.0.0/16)


---

# ⚙️ Tech Stack

- AWS (EC2, VPC, Subnets, IGW, Security Groups)
- Terraform (Infrastructure as Code)
- Ansible (Configuration Management)
- Ubuntu Server
- Nginx
- Git & GitHub

---

# 🚀 Step-by-Step Workflow

---

## 1. Infrastructure Provisioning (Terraform)

### Initialize Terraform
```bash
terraform init
Validate configuration
terraform validate
Preview infrastructure
terraform plan
Deploy infrastructure
terraform apply
What Terraform Creates
VPC (10.0.0.0/16)
Public Subnet (10.0.1.0/24)
Private Subnet (10.0.2.0/24)
Internet Gateway
Route Table (public internet access)
Security Group (HTTP, HTTPS, SSH)
EC2 Instance (Ubuntu)
🌐 Networking Explanation
VPC

Isolated network environment in AWS.

Subnet

Divides VPC into public/private sections.

Internet Gateway

Allows communication between VPC and the internet.

Route Table

Defines traffic direction rules.

🔐 Security Group Rules
Port	Protocol	Purpose
22	SSH	Remote server access
80	HTTP	Web traffic
443	HTTPS	Secure web traffic

Outbound traffic is open to allow updates and package installation.

⚙️ Configuration Management (Ansible)
Connect to EC2
ansible -i inventory.ini web -m ping
Install Nginx
ansible-playbook -i inventory.ini install-nginx.yml
What Ansible does:
Connects to EC2 via SSH
Installs Nginx
Starts web service
Ensures idempotent configuration
🌍 Final Output

Once deployment is complete:

EC2 instance runs publicly
Nginx serves a web page
The instance is accessible via public IP
🧪 Validation

Open in browser:

http://<EC2_PUBLIC_IP>
🧹 Cleanup (VERY IMPORTANT)

To avoid AWS charges:

terraform destroy

This removes:

EC2 instance
VPC
Subnets
Security Groups
Route Tables
Internet Gateway
❓ Interview FAQ (Integrated)
What is an EC2 instance?

A virtual server in AWS is used to run applications.

Why use a subnet?

It defines network placement and controls routing.

What is a Security Group?

A virtual firewall controls inbound and outbound traffic.

What is the difference between AMI and Instance Type?
AMI = operating system image
Instance Type = CPU/memory configuration
Why Terraform?

To define infrastructure as code and ensure repeatability.

Why Ansible?

To automate server configuration and software installation.

Why is SSH (port 22) needed?

To remotely access and manage the EC2 instance.

Why destroy resources?

To avoid unnecessary cloud costs.

📌 Key Learnings
AWS networking fundamentals
Infrastructure as Code (Terraform)
Configuration automation (Ansible)
Cloud deployment lifecycle
Real-world DevOps workflow
Safe teardown practices
👤 Author

Nkechi Anna Ahanonye - DevOps Engineer 
Focused on Cloud, Automation, and CI/CD systems
