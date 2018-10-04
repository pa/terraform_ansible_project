# A Generic Ansible playbook to deploy an terraform project

This repository contains a Terraform project that builds VPC with Public and Private Subnets in AWS.


## Contents

- [ansible-playbook.yml](ansible-playbook.yml): This yml file contains the terraform module to deploy resources in AWS.
- [terraform](./terraform): This directory contains all the terraform file required for deployment.
- [provider.tf](./terraform/provider.tf): This file contains cloud provider to deploy the terraform modules.
- [backend.tf](./terraform/backend.tf): This file contains the backend configuration for terraform execution state.
- [variables.tf](./terraform/variables.tf): This file contains default variable values for other terraform modules.
- [iam.tf](./terraform/iam.tf): This file contains role, policy and instance profile to attach to the EC2 instance.
- [sg.tf](./terraform/sg.tf): This file provides a security group resource.
- [vpc.tf](./terraform/vpc.tf): This file provides a VPC resource with Subnets, Internet gateway, NAT instance, Route table.
- [private_instance.tf](./terraform/private_instance.tf): This file provides a EC2 instance resource to attach to private subnet.
- [public_instance.tf](./terraform/public_instance.tf): This file provides a EC2 instance resource to attach to public subnet.

## How to run ansible-playbook.yml
```
  ansible-playbook ansible-playbook.yml  -e "key_name=sample-key-name"
```
## Sample Execution

Below output is for terraform plan

```
[root@ip-172-31-94-225 terraform_ansible_project]# ansible-playbook ansible-playbook.yml  -e "key_name=*********"
 [WARNING]: provided hosts list is empty, only localhost is available. Note that the implicit localhost does not match 'all'

 [WARNING]: Ignoring invalid attribute: variables

Type for the condition plan or plan_execute or execute: plan

PLAY [localhost] *******************************************************************************************************************************************************

TASK [terraform init] **************************************************************************************************************************************************
changed: [localhost]

TASK [terraform plan] **************************************************************************************************************************************************
ok: [localhost]

TASK [terraform apply] *************************************************************************************************************************************************
skipping: [localhost]

PLAY RECAP *************************************************************************************************************************************************************
localhost                  : ok=2    changed=1    unreachable=0    failed=0
```

Below output is for terraform apply

```
[root@ip-172-31-94-225 terraform_ansible_project]# ansible-playbook ansible-playbook.yml  -e "key_name=*********"
 [WARNING]: provided hosts list is empty, only localhost is available. Note that the implicit localhost does not match 'all'

 [WARNING]: Ignoring invalid attribute: variables

Type for the condition plan or plan_execute or execute: apply

PLAY [localhost] *******************************************************************************************************************************************************

TASK [terraform init] **************************************************************************************************************************************************
changed: [localhost]

TASK [terraform plan] **************************************************************************************************************************************************
ok: [localhost]

TASK [terraform apply] *************************************************************************************************************************************************
changed: [localhost]

PLAY RECAP *************************************************************************************************************************************************************
localhost                  : ok=3    changed=2    unreachable=0    failed=0

```
