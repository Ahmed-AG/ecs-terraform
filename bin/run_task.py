# POC for using Boto3 to "run_task" (Stand Alone) on an ECS Cluster
import sys
import boto3
import json

# Read command line arguments
CLUSTER_NAME         = sys.argv[1]
SUBNET_ID            = sys.argv[2]
SG_GROUP             = sys.argv[3]
TASK_DEFINITION_NAME = sys.argv[4]
URL_ENV              = sys.argv[5]

client = boto3.client('ecs')

response = client.run_task(
    cluster=CLUSTER_NAME,
    count=1,
    launchType='FARGATE',
    networkConfiguration={
        'awsvpcConfiguration': {
            'subnets': [
                SUBNET_ID,
            ],
            'securityGroups': [
                SG_GROUP,
            ],
            'assignPublicIp': 'ENABLED'
        }
    },
    overrides={
        'containerOverrides': [
            {
                'name' : 'fargate-app-terraform',
                'environment': [
                    {
                        'name': 'URL',
                        'value': URL_ENV
                    }
                ]
            }
        ]
    },
    taskDefinition=TASK_DEFINITION_NAME
)
print(response)