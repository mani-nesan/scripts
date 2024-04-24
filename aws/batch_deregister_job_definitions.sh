#!/usr/bin/env bash
get_job_definition_arns() {
    aws batch describe-job-definitions --status ACTIVE --region ap-southeast-1 --max-items 2000 \
        | jq -M -r '.jobDefinitions[].jobDefinitionArn'
}

delete_job_definition() {
    local arn=$1

    aws batch deregister-job-definition \
        --region ap-southeast-1 \
        --job-definition "${arn}" > /dev/null
}

for arn in $(get_job_definition_arns)
do
    echo "Deregistering ${arn}..."
    delete_job_definition "${arn}"
done