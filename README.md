<h1>Three Tier Application</h1>

 

Prerequisites

AWS Account
Proper Permissions for your user
Terraform installed on your IDE
AWS CLI installed and configured on your IDE
SSH Agent (For Windows PowerShell)




Command to create the keypair for access to the bastion host

aws ec2 create-key-pair --key-name Three-Tier-Deployment --query 'KeyMaterial' --output text > Three-Tier-Deployment.pem
