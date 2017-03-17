# clearlogs-shell
A shell,clear logs for linux

**用途：**
ghostsf维护服务器有几次发现服务器出现奇葩错误，检查了下发现是写入异常，然后发现磁盘满了。然后再已检查，累积的服务器log达到了上百G，这就尴尬了。所以定期清理这些日志文件是有必要的，尤其对那些空间容量小的服务器。

** 使用方法：**
建一个.sh结尾的shell脚本文件，然后修改下相关服务器log日志文件目录，直接执行接口。
可以结合crontab，进行定期执行清理log的脚本。
当然脚本代码都在这里了，想怎么改就怎么改。

** 方法说明：**
脚本里写了三个简单方法，当然你也可以自己修改或增加的。
delete_old_log（） 用来删除指定目录，指定时间内的log日志。当然这里指定的时间，是指设定的DAYS之前的日志。具体可参考find -mtime + 的含义。
compress_log() 用于压缩备份一下日志
rotate_catalina_log() 用于清空日志以及备份日志，不要备份就直接删掉/bin/cp $TOMCAT_LOG_DIR/catalina.out $TOMCAT_LOG_DIR/catalina.out.$HOSTNAME.$DATE即可。
