
#!/bin/bash
FXPT1=/usr/local/tomcat7
PID1=`ps aux |grep -v grep |grep -F "/usr/local/tomcat7"|awk '{print $2}'`
file=/usr/local/tomcat7/webapps/fxpt.war.update
echo "1. SHUTDOWN TOMCAT SUCCESS"
$FXPT1/bin/./shutdown.sh > /dev/null 2>&1
sleep 5
rm -rf /usr/local/tomcat7/webapps/fxpt
kill -s 9 $PID1 > /dev/null 2>&1
if [ ! -f "$file"]; then 
	echo fxpt.war.update not exists!please check it again
else
	TODAY=`date +%Y-%m-%d-%H%M`
	mv /usr/local/tomcat7/webapps/fxpt.war /var/code_backup/fxpt_$TODAY.war
	mv /usr/local/tomcat7/webapps/fxpt.war.update /usr/local/tomcat7/webapps/fxpt.war
	echo "FXPT WAR BACKUP SUCCESS"
echo "2. STARTUP TOMCAT SUCCESS"
$FXPT1/bin/./startup.sh > /dev/null 2>&1
