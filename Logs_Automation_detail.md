Daily requests to web server generate lots of access logs. These log files  serve as an  important tool for troubleshooting.  However, these logs can also result in the servers running out of disk space and can make them stop working. To avoid this, one of the best practices is to create a backup of these logs by compressing the logs directory and archiving it to the s3 bucket (Storage). 

All this becomes a weekly/daily activity. Therefore automation bash script named ‘automation.sh’ to automate all these workflows.

1. The bash script ‘automation.sh’ starts with creating a timestamp in particular format. It will be easier to use in future references.
2. Then it will create a tar of all the access logs in nginx and save it to /root/logs folder.
3. The next step will copy the tar file to s3 bucket.
 
In the next task it will essentially upgrade the existing automation.sh script such that script will create a record when the tar file is copied from the EC2 to s3.

4. The script checks for the presence of the inventory.html file in /var/www/html/; if not found, creates it. This file will essentially serve as a web page to get the      metadata of the archived logs (Hitting ip/inventory.html will show the bookkeeping data).
5. The first line in the inventory.html file should be a header that will look like this

    Log Type      Date Created        Type     Size

6. If an inventory file already exists, the content of the file will not be deleted or overwritten. New content will only be appended in a new line.
7. The inventory file looks like the following after multiple runs:

    Log Type      Date Created        Type     Size     
    httpd-logs    01012022-120100     tar      10K
    httpd-logs    02012022-120100     tar      40K
    httpd-logs    03012022-120100     tar      4K
    
8. It will then delete the tar file previously created to avoid consumption of disk space, and it will also remove the logs.
9. All these tasks can be automated by setting up the cronjob.
