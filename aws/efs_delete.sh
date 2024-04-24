
for efs in $(aws efs describe-file-systems --query "FileSystems[*].FileSystemId"  --output text) ; do echo $efs; aws efs delete-file-system  --file-system-id $efs;  done
