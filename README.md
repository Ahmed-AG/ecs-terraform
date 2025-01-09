# ecs-terraform

1. Set `backend.tf`:

```bash
terraform {
  backend "s3" {
    bucket         = <BUCKET NAME>
    key            = <STATEFILE>
    encrypt        = false
    region         = <REGION>
  }
}
```
2. Deploy VPC and Cluster by the Terraform commands:

```bash
terraform init
terraform plan
terraform apply --auto-approve
```

1. Set envirnoment variables:

```bash
export CLUSTER_NAME=$(terraform output -raw CLUSTER_NAME)
export SG_GROUP=$(terraform output -raw SG_GROUP)
export SUBNET_ID=$(terraform output -raw SUBNET_ID)
export TASK_DEFINITION_NAME=$(terraform output -raw TASK_DEFINITION_NAME)
```

4. Run a task:

```bash
python bin/run_task.py $CLUSTER_NAME $SUBNET_ID $SG_GROUP $TASK_DEFINITION_NAME
```
##
