## Three Tier Application

This Terraform project was created to deploy an infrastructure of three-tier components. The infrastructure is secured by a Bastion host that is used for the SSH connection and connects with the other 2 tiers of the application, and we use an autoscaling group to maintain the scalability and redundancy of the components, on the other hand, we use a load balancer to guarantee the connection of the frontend through the internet.

## Architecture
<img src="https://github.com/alejog38/AWSThreeTierApp/blob/main/ThreeTierApp.png">


## Prerequisites 

-   AWS Account
-   Proper Permissions for your user
-   Terraform installed on your IDE
-   AWS CLI installed and configured on your IDE
-   SSH Agent (For Windows PowerShell)


## AWS configuration settings CLI
Run command:
```sh 
aws configure
AWS Access Key ID [None]: access key
AWS Secret Access Key [None]: secret access key
Default region name [None]: region
Default output format [None]: default output format
```

## Command to create the keypair for access to the bastion host

aws ec2 create-key-pair --key-name Three-Tier-Deployment --query 'KeyMaterial' --output text > Three-Tier-Deployment.pem


## How to execute terraform code

1. Create a folder for the repository
2. Navigate to the project directory
3. Clone the repository:
 ```sh
git clone https://github.com/alejog38/AWSThreeTierApp.git
```

4. Initialize terraform
```sh 
terraform init
```
5. Edit the var.tfvars file with your desired values.
6. Verification of the configuration
```sh
terraform plan -var-file=var.tfvars
```
7. Deploy
```sh
terraform apply -var-file=var.tfvars
```
8. Destroy
```sh
terraform destroy -var-file=var.tfvars
```



## How to connect to the Bastion Host
Command to connect to the Bastion host, we need to use the keypair file
```sh
ssh -i <Keypair_Path> ec2-user@<Public_IP_Address>
```

If you want to connect to the other EC2 instances when you entering to the Bastion host you can use:
```sh
ssh -A ec2-user@<Private_IP_Address>
```