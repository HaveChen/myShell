#!/bin/sh
### ====================================================================== ###
##                                                                          ##
##  Pentaho Start Script                                                    ##
##                                                                          ##
### ====================================================================== ###

export LC_ALL="en_US.UTF-8"

currentDate=$(date +%Y/%m/%d/%H)

# currentDate=$(date +%Y/%m/%d -d "$currentDate +2 days")

svn_path=./pentaho-export/cntest.test_v2.0
# 代码
# svn co $svn_path
svn_path_backups=$svn_path/pentaho/backups/$currentDate


mkdir -p $svn_path_backups/fxpt
mkdir -p $svn_path_backups/fxpt_ns
mkdir -p $svn_path_backups/fxpt_xinjiang


echo $svn_path_backups/fxpt
echo $svn_path_backups/fxpt_ns
echo $svn_path_backups/fxpt_xinjiang


/home/pentaho/biserver-ce-5.3.0.0-213/biserver-ce/import-export.sh --export --url=http://localhost:28080/pentaho --username=admin --password=cntest123 --charset=UTF-8 --path=/public/cde --file-path=$svn_path_backups/cde.zip --overwrite=true --permission=true --retainOwnership=true
/home/pentaho/biserver-ce-5.3.0.0-213/biserver-ce/import-export.sh --export --url=http://localhost:28080/pentaho --username=admin --password=cntest123 --charset=UTF-8 --path=/home/fxpt --file-path=$svn_path_backups/fxpt/fxpt.zip --overwrite=true --permission=true --retainOwnership=true
/home/pentaho/biserver-ce-5.3.0.0-213/biserver-ce/import-export.sh --export --url=http://localhost:28080/pentaho --username=admin --password=cntest123 --charset=UTF-8 --path=/home/fxpt_ns --file-path=$svn_path_backups/fxpt_ns/fxpt_ns.zip --overwrite=true --permission=true --retainOwnership=true
/home/pentaho/biserver-ce-5.3.0.0-213/biserver-ce/import-export.sh --export --url=http://localhost:28080/pentaho --username=admin --password=cntest123 --charset=UTF-8 --path=/home/fxpt_xinjiang --file-path=$svn_path_backups/fxpt_xinjiang/fxpt_xinjiang.zip --overwrite=true --permission=true --retainOwnership=true

# unzip ./pentaho-export/public-test.zip -d ./pentaho-export



# svn st $svn_path |grep "? \+" | sed "s/? \+//"|xargs rm -rf
# svn revert -R ./pentaho-export/cntest.test_v2.0/

# 添加所有新文件
echo "svn st $svn_path |grep "? \+" | sed "s/? \+//"|xargs svn add"
svn st $svn_path |grep "? \+" | sed "s/? \+//"|xargs svn add

echo "svn ci $svn_path -m 'auto commit by script'"
svn ci $svn_path -m 'auto commit by script'

