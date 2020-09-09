<#
    This will delete all unused docker related files (Containers, Images, NIC and so on)
    and it will also clear the artifacts that are not being used in the last 7 days (configurable)
    Need navcontainerhelper/bccontainerhelper
#>

# This will prune the docker related things
docker system prune --all

#This will delete the unused artifacts
Flush-ContainerHelperCache -keepDays 7 