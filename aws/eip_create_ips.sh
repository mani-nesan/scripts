#!/bin/bash

# Number of Elastic IPs to create
NUM_EIPS=8

# AWS Region
REGION="ap-southeast-1"

# Tags (Modify as needed)
TAGS=(
  "Key=Environment,Value=workshop"
  "Key=Owner,Value=gedac"
  "Key=Purpose,Value=MaxQuantAnalysis"
)

# Allocate Elastic IPs and tag them
for i in $(seq 1 $NUM_EIPS); do
  ALLOCATION_ID=$(aws ec2 allocate-address --region $REGION --query 'AllocationId' --output text)
  echo "Created Elastic IP with Allocation ID: $ALLOCATION_ID"

  # Tag the Elastic IP
  aws ec2 create-tags --resources $ALLOCATION_ID --tags "${TAGS[@]}" --region $REGION
  echo "Tagged Elastic IP ($ALLOCATION_ID) with: ${TAGS[*]}"
done
