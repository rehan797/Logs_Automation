# Logs_Automation

Daily requests to web server generate lots of access logs. These log files  serve as an  important tool for troubleshooting.  However, these logs can also result in the servers running out of disk space and can make them stop working. To avoid this, one of the best practices is to create a backup of these logs by compressing the logs directory and archiving it to the s3 bucket (Storage). 

All this becomes a weekly/daily activity. These tasks can take a long time if done manually again and again. Therefore automation bash script named ‘automation.sh’ to automate all these workflows.

1. The bash scrpit ‘automation.sh’ starts with creating a timestamp in particular format. It will be easier to use in future references
2. Then it will create a tar of all the access logs in nginx and save it to /root/logs folder
3. The next step will copy the tar file to s3 bucket that has to be created manually
4. 
