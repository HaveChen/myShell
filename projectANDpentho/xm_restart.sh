
#!/bin/bash
FXPT1=/usr/local/tomcat7
PID1=`ps aux |grep -v grep |grep -F "/usr/local/tomcat7"|awk '{print $2}'`
echo "1. SHUTDOWN TOMCAT SUCCESS"
$FXPT1/bin/./shutdown.sh > /dev/null 2>&1
sleep 5
rm -rf /usr/local/tomcat7/webapps/fxpt
kill -s 9 $PID1 > /dev/null 2>&1
echo "2. STARTUP TOMCAT SUCCESS"
$FXPT1/bin/./startup.sh > /dev/null 2>&1
