#!/bin/bash

echo "ID                        NOME            STATUS          INSTANCE TYPE   KEYNAME         PRIVATE IP      PUBLIC IP"
echo "-------------------------------------------------------------------------------------------------------------------"

aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId,Tags[?Key==`Name`].Value|[0],State.Name,InstanceType,KeyName,PrivateIpAddress,PublicIpAddress]' --output text --profile=$1 --region=$2 | sed 's/None$/None\n/' | sed '$!N;s/\n/ /'
