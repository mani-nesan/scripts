#!/usr/bin/env bash
get_task_definition_arns() {
    aws ecs list-task-definitions --region ap-southeast-1 \
        | jq -M -r '.taskDefinitionArns | .[]'
}

delete_task_definition() {
    local arn=$1

    aws ecs deregister-task-definition \
        --region ap-southeast-1 \
        --task-definition "${arn}" > /dev/null
}

for arn in $(get_task_definition_arns)
do
    echo "Deregistering ${arn}..."
    delete_task_definition "${arn}"
done