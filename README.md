# Terraform Localstack
Example showing how to deploy to Localstack with Hashicorp Terraform

## Prerequestites
- Docker (or compatible system)
- Python 3 with pip

## Setup
1. Download/Install Localstack CLI from https://docs.localstack.cloud/get-started/#localstack-cli
2. Run `localstack start -d` to start localstack in a local docker container
3. Run `localstack status services` to ensure all AWS services are available

## Running

```bash
cd ./infrastructure
terraform init
```

Once the terraform modules have been downloaded, you can run `terraform plan` or `terraform apply` as needed.

Emergency change
