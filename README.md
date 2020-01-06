Simple Terraform script to deploy ec2 instance for pentest

#### Requirements

+ Terraform installed (just binary)
+ Keypair from AWS to access instance with SSH

#### Example

`terraform plan` - show infrastructure going to execute

`terraform apply` - deploy (`yes` on prompt)

`ssh -i aws-spryffee.pem ec2-3-0-184-126.ap-southeast-1.compute.amazonaws.com`

`terraform destroy` - destroy (`yes` on prompt)

