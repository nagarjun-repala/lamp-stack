This is to provision LAMP stack
After the deployment ubuntu will be configured with apache2 and php installed

This terraform scripts will deploy the following components:
i) VPC
ii) Subnets(two public and two private)
iii) One NAT gateway(this is for private subnets and internet access to webserver)
iv) Route tables for subnets
v) Internet gateway
vi) EIP for NAT gateway
viii) Application Load Balancer
ix) RDS
x) EC2 (Ubuntu)
xi) Secrets Manager
xii) IAM role for EC2
xii) Security group for each resource EC2, Application Load Balancer and RDS.

Initialize the repository with terraform with "terraform init"
Use your own credentials for AWS to deploy (Configure AWS profile).

Deployment:
1) Create your own rsa public to create key pair on AWS.
2) Check for variables.tf and create a var.tfvars file to pass variables as a file for terraform script. You can use any name for for .tfvars
3) Use exact same public key i.e is generated from step 1 and pass it as a variable for terraform script
3) To deploy run "terraform apply -var-file var.tfvars"
4) Wait for the resources to provision and it will output the Application load balancer endpoint.
5) Send the curl request to the endpoint(check terraform output for the endpoint)

Note: Wait for some more time after step 4 because EC2 should be available to serve the request.

For high available setup:

we can extend these terraform scripts like we can have rds to be deployed in multi az, creating 
read replicas for rds. Deploying our web server in auto scaling group to make web server more
resilient and scalable.
