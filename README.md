# Terraform  Installation 

### 1. Using This Command You Can Install Terraform In Ubuntu...!
```bash
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```

### Some Important Command..!
```bash
terraform init
terraform plan
terraform apply
terraform distroy
```

### Apply Command With Variable Value...! 
```bash
terraform apply -var vpc_id = "vpc-0ed3c429e5882f1e0"
```
