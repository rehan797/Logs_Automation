A bash script named ‘automation.sh’ to automate all these workflows.

1. Creating a timestamp in particular format. It will be easier to use in future references.
2. Then it will create a tar of all the access logs in nginx and save it to /root/logs folder.
3. The next step will copy the tar file to s3 bucket.
 
In the next task it will upgrade the existing automation.sh script such that script will create a record when the tar file is copied from the EC2 to s3.

4. The script checks for the presence of the inventory.html file in /var/www/html/; if not found, creates it. This file will serve as a web page to get the metadata of the archived logs (ip/inventory.html).
5. The first line in the inventory.html file should be a header that will look like this:

    Log Type       Date Created         Type      Size

6. If an inventory file already exists, new content will only be appended in a new line.
7. The inventory file looks like the following after multiple runs:

    Log Type       Date Created         Type      Size     
    httpd-logs     01012022-120100      tar       10K
    httpd-logs     02012022-120100      tar       40K
    httpd-logs     03012022-120100      tar       4K
    
8. It will then delete the tar file previously created to avoid consumption of disk space, and it will also remove the logs.
9. All these tasks can be automated by setting up the cronjob.
