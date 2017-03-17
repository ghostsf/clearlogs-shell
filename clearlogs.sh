#!/bin/sh
#File date format
DATE='/bin/date +%Y%m%d'
#Arcive period
DAYS=60                #删除多少天的日志 #删除多少天的日志
HOSTNAME='hostname -a'
#日志路径
TOMCAT_LOG_DIR=/home/www/logs/tomcat    
#日志位置
APACHE_LOG_DIR=/var/log/httpd
### Delete old log ###
**delete_old_log**(){
find $TOMCAT_LOG_DIR -mtime +$DAYS -name "catalina.out*" -exec rm -fr {} \;
find $APACHE_LOG_DIR -mtime +$DAYS -name "access_log*"   -exec rm -fr {} \;
find $APACHE_LOG_DIR -mtime +$DAYS -name "error_log*"    -exec rm -fr {} \;
}
## compress tomcat log files
**compress_log**(){
if[-f $TOMCAT_LOG_DIR/catalina.out.$HOSTNAME.$DATE];
then/bin/nice /usr/bin/gzip -f $TOMCAT_LOG_DIR/catalina.out.$HOSTNAME.$DATE fi
#compress apache log files
if[-f $APACHE_LOG_DIR/access.log.$DATE3];
then/bin/nice /usr/bin/gzip -f $APACHE_LOG_DIR/access.log.$DATE3 fi
if[-f $APACHE_LOG_DIR/error.log.$DATE3];
then/bin/nice /usr/bin/gzip -f $APACHE_LOG_DIR/error.log.$DATE3 fi
if[-f $APACHE_LOG_DIR/mod_jk.log.$DATE4];
then/bin/nice /usr/bin/gzip -f $APACHE_LOG_DIR/mod_jk.log.$DATE4 fi
}
###Rotate catalina log###
 **rotate_catalina_log**(){
if[-f $TOMCAT_LOG_DIR/catalina.out];
then/bin/nice /bin/cp $TOMCAT_LOG_DIR/catalina.out $TOMCAT_LOG_DIR/catalina.out.$HOSTNAME.$DATE cat /dev/null>$TOMCAT_LOG_DIR/catalina.out fi
}
###Main###
echo "######## start script $0 exec:'date +%Y-%m-%d_%H:%M:%S'#############"
delete_old_log 
echo "######## end script $0 exec:'date +%Y-%m-%d_%H:%M:%S'##############"
