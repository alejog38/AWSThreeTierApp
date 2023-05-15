<h1>Three Tier Application</h1>

This Terraform project was created to deploy an infrastructure of three-tier components. The infrastructure is secured by a Bastion host that is used for the SSH connection and connects with the other 2 tiers of the application, and we use an autoscaling group to maintain the scalability and redundancy of the components, on the other hand, we use a load balancer to guarantee the connection of the frontend through the internet.

<h3>Architecture</h3>
<img src="https://drive.google.com/file/d/1NvkgaV_l9xiFrRuH2JFl_lWoPYDMnJsR/view?usp=sharing">


<h3>Prerequisites</h3>

AWS Account
Proper Permissions for your user
Terraform installed on your IDE
AWS CLI installed and configured on your IDE
SSH Agent (For Windows PowerShell)




<h3>Command to create the keypair for access to the bastion host</h3>

aws ec2 create-key-pair --key-name Three-Tier-Deployment --query 'KeyMaterial' --output text > Three-Tier-Deployment.pem


<h3>How to execute terraform code</h3>

1. Create a folder for the repository
2. Clone the repository:git clone https://github.com/alejog38/AWSThreeTierApp.git
3. Navigate to the project directory
4. Initialize terraform 
terraform init
5. Edit the var.tfvars file with your desired values.
6. Verification of the configuration
terraform plan -var-file=var.tfvars
7. Deploy
terraform apply -var-file=var.tfvars
8. Destroy
terraform destroy -var-file=var.tfvars

