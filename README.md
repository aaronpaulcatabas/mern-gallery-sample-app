# MERN Gallery Application Deployment Automation

## Prerequisites

- AWS account with access keys
- Terraform installed
- Ansible installed
- Jenkins server
- Docker Hub account

## Automation Workflow

  1. Infrastructure Provisioning with Terraform
    
      Configure Terraform:
        - Create terraform.tfvars
        - Test/Apply Terraform configuration:

    cd terraform
    terraform init
    terraform plan
    terraform apply

  2. Configuration Management with Ansible
  3. Continuous Deployment with Jenkins

## Verification Steps

  1. Access the application at: http://<proxy-public-ip>
  2. Test Todo List functionality:
    - Add task → Refresh → Verify persistence
    - Delete task → Refresh → Verify removal
  3. Test Image Upload:
    - Upload image → Refresh → Verify display

## Maintenance

- Infrastructure updates: Modify Terraform files and reapply
- Configuration updates: Modify Ansible playbooks and rerun
- Application updates: Push changes to GitHub to trigger Jenkins pipeline

## Cleanup

    cd terraform
    terraform destroy