timestamp=$(date '+%d%m%Y-%H%M%S')
tar -cvf /root/logs/"httpd-logs-$timestamp.tar" /var/log/nginx

aws s3 cp /root/logs/httpd-logs-${timestamp}.tar  s3://s3bucket-144

if [ ! -f /root/logs/inventory.html ]
then
                echo -e "Log Type\tTime Created\tType\tSize" > /root/logs/inventory.html
                echo -e "httpd-logs\t$timestamp\ttar\t`du -sh /root/logs/httpd-logs-$timestamp.tar | awk '{print $1}'` " >> /root/logs/inventory.html
        else
                echo -e "httpd-logs\t$timestamp\ttar\t`du -sh /root/logs/httpd-logs-$timestamp.tar | awk '{print $1}'` " >> /root/logs/inventory.html

fi

rm -f /root/logs/httpd-logs-$timestamp.tar

> /var/log/nginx/access.log

> /var/log/nginx/error.log
