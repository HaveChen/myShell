#!/bin/sh
### ====================================================================== ###
##                                                                          ##
##  Pentaho Start Script                                                    ##
##                                                                          ##
### ====================================================================== ###

export LC_ALL="en_US.UTF-8"

#svn_path=/tmp
svn_path_backups=/tmp/pentaho/realTimeBak

#svn co http://192.168.2.222/cntest/cntest2017/CNT-FXPT_R01/01-Workspace/03-Source/02-SourceCode/cntest.test_v2.0/pentaho/backups/realTimeBak --username wusq --password wusq  /tmp/pentaho/realTimeBak

mkdir -p $svn_path_backups

echo $svn_path_backups

/home/pentaho/biserver-ce-5.3.0.0-213/biserver-ce/import-export.sh --export --url=http://localhost:28080/pentaho --username=admin --password=cntest123 --charset=UTF-8 --path=/public/cde --file-path=$svn_path_backups/cde.zip --overwrite=true --permission=true --retainOwnership=true
/home/pentaho/biserver-ce-5.3.0.0-213/biserver-ce/import-export.sh --export --url=http://localhost:28080/pentaho --username=admin --password=cntest123 --charset=UTF-8 --path=/home/fxpt --file-path=$svn_path_backups/fxpt.zip --overwrite=true --permission=true --retainOwnership=true
/home/pentaho/biserver-ce-5.3.0.0-213/biserver-ce/import-export.sh --export --url=http://localhost:28080/pentaho --username=admin --password=cntest123 --charset=UTF-8 --path=/home/fxpt_ns --file-path=$svn_path_backups/fxpt_ns.zip --overwrite=true --permission=true --retainOwnership=true
/home/pentaho/biserver-ce-5.3.0.0-213/biserver-ce/import-export.sh --export --url=http://localhost:28080/pentaho --username=admin --password=cntest123 --charset=UTF-8 --path=/home/fxpt_xinjiang --file-path=$svn_path_backups/fxpt_xinjiang.zip --overwrite=true --permission=true --retainOwnership=true

unzip -o  $svn_path_backups/cde.zip  -d  $svn_path_backups -x exportManifest.xml
unzip -o  $svn_path_backups/fxpt.zip  -d  $svn_path_backups  -x exportManifest.xml
unzip -o  $svn_path_backups/fxpt_ns.zip  -d  $svn_path_backups  -x exportManifest.xml
unzip -o  $svn_path_backups/fxpt_xinjiang.zip  -d  $svn_path_backups  -x exportManifest.xml
rm $svn_path_backups/*.zip

# svn st $svn_path |grep "? \+" | sed "s/? \+//"|xargs rm -rf
# svn revert -R ./pentaho-export/cntest.test_v2.0/

# 添加所有新文件
echo "svn st $svn_path |grep "? \+" | sed "s/? \+//"|xargs svn add"
svn st $svn_path_backups |grep "? \+" | sed "s/? \+//"|xargs svn add

echo "svn ci $svn_path -m 'auto commit by script'"
svn ci $svn_path_backups -m 'auto commit by script'

