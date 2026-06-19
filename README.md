DevOps Rescue Lab

A complete end-to-end DevOps project demonstrating real-world cloud infrastructure provisioning, configuration automation, and application deployment using Terraform, Ansible, and AWS.

This project simulates a production-style DevOps workflow:

Provision → Configure → Deploy → Destroy

📸 Architecture Diagram
User
  ↓
Internet
  ↓
EC2 Instance (Ubuntu + Nginx)
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
🏗️ Tech Stack
AWS (EC2, VPC, Subnets, IGW, Security Groups)
Terraform (Infrastructure as Code)
Ansible (Configuration Management)
Ubuntu Server
Nginx
Git & GitHub
📸 Screenshots (Add Here)

Replace with real images:

Terraform apply successful output
EC2 instance running in AWS console
Ansible Nginx installation success
Browser showing Nginx page via public IP
🚀 Phase 1: Infrastructure Provisioning (Terraform)
Initialize Terraform
terraform init
Validate configuration
terraform validate
Preview changes
terraform plan
Deploy infrastructure
terraform apply
🧱 What Terraform Creates
VPC (10.0.0.0/16)
Public Subnet (10.0.1.0/24)
Private Subnet (10.0.2.0/24)
Internet Gateway
Route Table
Security Group (HTTP, HTTPS, SSH)
EC2 Instance (Ubuntu 22.04)
🌐 Networking Concepts
VPC

A logically isolated network inside AWS.

Subnet

Defines where resources live (public or private).

Internet Gateway

Allows internet access for public resources.

Route Table

Controls traffic flow inside the VPC.

🔐 Security Group Rules
Port	Protocol	Purpose
22	SSH	Remote access
80	HTTP	Web traffic
443	HTTPS	Secure web traffic

Outbound traffic is open to allow updates and package installation.

⚙️ Phase 2: Configuration Management (Ansible)
Test connection
ansible -i inventory.ini web -m ping
Install Nginx
ansible-playbook -i inventory.ini install-nginx.yml
🧠 What Ansible Does
Connects to EC2 via SSH
Installs Nginx
Starts and enables service
Ensures idempotent configuration
🌍 Final Output

After deployment:

EC2 is publicly accessible
Nginx is running
Web server responds via browser
http://<EC2_PUBLIC_IP>
🧹 Cleanup (VERY IMPORTANT)

To avoid AWS charges:

terraform destroy

This removes:

EC2
VPC
Subnets
Security Groups
Internet Gateway
Route Tables
❓ Interview FAQ (DevOps Focused)
What is an EC2 instance?

A virtual server in AWS used to run applications and services.

Why use a subnet?

It defines network segmentation and controls resource placement.

What is a Security Group?

A virtual firewall that controls inbound and outbound traffic.

Difference between AMI and Instance Type?
AMI → Operating system image
Instance Type → CPU, RAM, and hardware size
Why Terraform?

To define infrastructure as code and ensure repeatable deployments.

Why Ansible?

To automate server configuration and software installation.

Why is SSH needed?

To remotely access and manage the EC2 instance securely.

Why destroy resources?

To prevent unnecessary cloud costs and avoid billing.

📌 Key Learnings
AWS networking fundamentals
Infrastructure as Code (Terraform)
Configuration automation (Ansible)
Cloud deployment lifecycle
Real-world DevOps workflow
Safe infrastructure teardown
👤 Author

Nkechi Anna Ahanonye
DevOps Engineer | Cloud & Automation Enthusiast
