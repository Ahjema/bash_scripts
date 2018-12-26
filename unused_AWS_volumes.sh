#!/bin/sh

for regions in `aws ec2 describe-regions --output text|awk {'print $3'}`
do
   for volumes in `aws ec2 describe-volumes --region $regions --query 'Volumes[*].[VolumeId, State]' --output text | grep available | awk '{print $1}'`
   do
      echo $regions" "$volumes
   done
done
