#!/bin/bash

if [[ $# -eq 0 ]] ; then
      echo -e "Usage: ListAWSInstances PROFILE"
      echo -e "Example:"
      echo -e "ListAWSInstances my-aws-profile"

    exit 1
fi

echo "Grabbing instances in all regions, please wait..."
for region in `aws ec2 describe-regions --output text | cut -f3`
do
echo ""
echo "region: $region"
echo "    ID    |    Name    |    Instance Type    |    Private IP    |    Public IP"
aws ec2 describe-instances --region $region --query 'Reservations[*].Instances[*].[InstanceId,Tags[?Key==`Name`].Value|[0],InstanceType,PrivateIpAddress,PublicIpAddress]' --output text --profile $1
echo ""
done
