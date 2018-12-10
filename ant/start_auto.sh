
#! /bin/sh
echo '####################tomcat start####################'
path=`pwd` #当前路径
tomcatPath=/usr/local/tomcat-fxpt2 #指定tomcat文件目录名称
cd $tomcatPath/bin #进入tomcat的bin目录
PID=$(ps -fu `whoami`|grep tomcat|grep -v grep|awk '{print $2}')
echo $PID
if [ -z "$PID" ];then
	echo "no tomcat process"
else
./shutdown.sh #停止tomcat服务
ps -ef | grep $tomcatPath| grep -v grep|awk '{print $2}'|xargs kill -9
fi
#sleep 1 #休眠1s
#cd ../webapps #进入tomcat的webapps目录
#rm -fr test #删除test文件目录
#mv test.war test.war.$(date +%Y%m%d) #备份webapps下的test16 cp $path/test.war ./ #复制test.war到webapps路径下
#sleep 1 #休眠1s
./startup.sh #启动tomcat服务
echo '####################tomcat start over####################'