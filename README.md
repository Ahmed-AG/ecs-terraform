# ecs-terraform

To deploy the cluster

```bash
terraform init
terraform plan
terraform apply --auto-approve
```

To set envirnoment variables:

```bash
export CLUSTER_NAME=$(terraform output -raw CLUSTER_NAME)
export SG_GROUP=$(terraform output -raw SG_GROUP)
export SUBNET_ID=$(terraform output -raw SUBNET_ID)
export TASK_DEFINITION_FILE="task-definitions/service.json"
export TASK_DEFINITION_NAME=$(terraform output -raw TASK_DEFINITION_NAME)
```

To run a task

```bash
python bin/run_task.py $CLUSTER_NAME $SUBNET_ID $SG_GROUP $TASK_DEFINITION_NAME
```
