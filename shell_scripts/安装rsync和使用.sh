#!/bin/bash
#
# 安装rsync和使用
# 环境：
# 客户端：10.192.30.59 fudao_db_cluster_002 (将本地文件备份到服务端)
# 服务端：10.192.30.60 fudao_db_cluster_003 (存储接收传输过来的文件)

# 1、安装rsync
# 客户端和服务端都需要安装
yum -y install rsync

# daemon模式的配置，只需要服务端操作
# rsync daemon模式是以rsync服务器形式运行，首先我们需要创建rsync服务器的配置文件，
# 配置文件：/etc/rsyncd.conf 默认此文件可能不存在，需要自己创建，配置信息如下：

cat > /etc/rsyncd.conf <<"EOF"
# 全局参数配置
port = 873
uid = rsync 
gid = rsync
 
# 使用chroot到文件系统中的目录中
use chroot = no

# 最大并发连接数
max connections = 200 

motd file = /etc/rsyncd.motd #定义服务器信息的，自己写 rsyncd.motd 文件内容
pid file = /var/run/rsyncd.pid
lock file = /var/run/rsyncd.lock
log file = /var/log/rsyncd.log

# 指定哪些文件不用进行压缩传输
dont compress = *.gz *.tgz *.zip *.z *.Z *.rpm *.deb *.bz2  

timeout = 300

###########下面指定模块，并设定模块配置参数，可以创建多个模块###########
#自定义模块
[dbbackup] 

#用来指定要备份的目录
path = /data/backup/  

#可以忽略一些IO错误 
ignore errors    

#设置no，客户端可以上传文件，yes是只读
read only = no      

#no为客户端可以下载，yes 不能下载
write only = no   

#允许连接的IP，强烈建议加上你允许的IP，多个IP逗号隔开
hosts allow = 10.192.30.0/24    

# 指定不允许连接到该模块的机器
hosts deny = 0.0.0.0/32 

#客户请求时，使用模块列表
list = yes   

#连接用户名，是虚拟用户与linux系统用户无关，多个用户名逗号隔开
auth users = sync_user   

#验证密码文件，文件格式为：用户名:密码
secrets file = /etc/rsyncd.secrets   


EOF

# 配置完后，再就是提供模块相关目录、身份验证文件等。
cat >/etc/rsyncd.motd <<"EOF"
+++++++++++++++++++++++++++++++++++++++++++
+ linuxsir.org  rsync  2002-2019 +
+++++++++++++++++++++++++++++++++++++++++++
EOF

useradd -r -s /sbin/nologin rsync
mkdir -p /data/backup/
chown -R rsync.rsync /data/backup/

# 写入配置时请将上面的注释信息去掉，并调整里面的相关参数。

# /etc/rsyncd.secrets 文件权限必须是600，创建好该文件后可以执行：

# 格式为 用户名:密码
[root@fudao_db_cluster_003 mysql]# cat /etc/rsyncd.secrets
sync_user:sync_userpassword
[root@fudao_db_cluster_003 mysql]# chmod 600 /etc/rsyncd.secrets

# 启动服务
#  rm -rf /var/run/rsyncd.pid
[root@fudao_db_cluster_003 scripts]# ps -ef|grep rsync
root      5119     1  0 22:35 ?        00:00:00 /usr/bin/rsync --daemon --config=/etc/rsyncd.conf
root      5121  5050  0 22:35 pts/0    00:00:00 grep rsync
[root@fudao_db_cluster_003 scripts]# 
chown -R rsync.rsync /data/backup/
rm -rf /var/run/rsyncd.pid

/usr/bin/rsync --daemon --config=/etc/rsyncd.conf
tail -f  /var/log/rsyncd.log

# 客户端免秘钥传输，需要创建密码文件，内容只写密码即可
[root@fudao_db_cluster_002 ~]# cat /etc/rsyncd.pass
sync_userpassword
# 文件权限必须 600
[root@fudao_db_cluster_002 ~]# chmod 600 /etc/rsyncd.pass

# 测试
# 将本地/data/mysql/scripts/下的文件目录传输至 10.192.30.60::dbbackup中的/data/backup/下
[root@fudao_db_cluster_002 ~]#  rsync -auzv --progress  --password-file=/etc/rsyncd.pass /data/mysql/scripts/slowquery_analysis.sh sync_user@10.192.30.60::dbbackup

sending incremental file list
slowquery_analysis.sh
        2049 100%    0.00kB/s    0:00:00 (xfer#1, to-check=0/1)

sent 938 bytes  received 27 bytes  1930.00 bytes/sec
total size is 2049  speedup is 2.12
[root@fudao_db_cluster_002 ~]# 


[root@fudao_db_cluster_002 ~]#  rsync -auzv --progress  --password-file=/etc/rsyncd.pass /data/mysql/scripts/* sync_user@10.192.30.60::dbbackup

sending incremental file list
slowquery_analysis.sh
        2049 100%    0.00kB/s    0:00:00 (xfer#1, to-check=2/3)
test_dir/
test_dir/slowquery_analysis.sh
        2049 100%    1.95MB/s    0:00:00 (xfer#2, to-check=0/3)

sent 1898 bytes  received 50 bytes  3896.00 bytes/sec
total size is 4098  speedup is 2.10
[root@fudao_db_cluster_002 ~]# 




# 注意：默认rsync服务器并不是自动启动的！

# 从远程下载10.192.30.60::dbbackup中的/data/backup/下的文件到本地的tmp目录下
[root@fudao_db_cluster_002 tmp]# rsync -auzv --progress --password-file=/etc/rsyncd.pass  sync_user@10.192.30.60::dbbackup /tmp/

receiving incremental file list
./
slowquery_analysis.sh
        2049 100%    1.95MB/s    0:00:00 (xfer#1, to-check=2/4)
test_dir/
test_dir/slowquery_analysis.sh
        2049 100%    1.95MB/s    0:00:00 (xfer#2, to-check=0/4)

sent 108 bytes  received 2006 bytes  4228.00 bytes/sec
total size is 4098  speedup is 1.94
  

问题一：

@ERROR: chroot failed
rsync error: error starting client-server protocol (code 5) at main.c(1522) [receiver=3.0.3]

原因：
服务器端的目录不存在或无权限，创建目录并修正权限可解决问题。

 

问题二：
@ERROR: auth failed on module tee
rsync error: error starting client-server protocol (code 5) at main.c(1522) [receiver=3.0.3]

原因：
服务器端该模块（tee）需要验证用户名密码，但客户端没有提供正确的用户名密码，认证失败。
提供正确的用户名密码解决此问题。

 

问题三：
@ERROR: Unknown module ‘tee_nonexists’
rsync error: error starting client-server protocol (code 5) at main.c(1522) [receiver=3.0.3]

原因：
服务器不存在指定模块。提供正确的模块名或在服务器端修改成你要的模块以解决问题。


问题四：
password file must not be other-accessible
continuing without password file
Password:
原因：
这是因为rsyncd.pwd rsyncd.secrets的权限不对，应该设置为600。如：chmod 600 rsyncd.pwd
问题五：
rsync: failed to connect to 218.107.243.2: No route to host (113)
rsync error: error in socket IO (code 10) at clientserver.c(104) [receiver=2.6.9]
原因：
对方没开机、防火墙阻挡、通过的网络上有防火墙阻挡，都有可能。关闭防火墙，其实就是把tcp udp的873端口打开。 

问题六：
rsync error: error starting client-server protocol (code 5) at main.c(1524) [Receiver=3.0.7]
原因：
/etc/rsyncd.conf配置文件内容有错误。请正确核对配置文件。
问题七：
rsync: chown "" failed: Invalid argument (22)
原因：
权限无法复制。去掉同步权限的参数即可。(这种情况多见于Linux向Windows的时候)


问题八：
@ERROR: daemon security issue -- contact admin
rsync error: error starting client-server protocol (code 5) at main.c(1530) [sender=3.0.6]
原因：
同步的目录里面有软连接文件，需要服务器端的/etc/rsyncd.conf打开use chroot = yes。掠过软连接文件。


问题九：
ERROR: module is read only
rsync error: syntax or usage error (code 1) at main.c(747) [receiver=2.6.8]
rsync: connection unexpectedly closed (4 bytes received so far) [sender]
rsync error: error in rsync protocol data stream (code 12) at io.c(600) [sender=3.0.6]
解决： 提示打开了read only，将配置文件 read only = no

问题十：
cat /var/log/rsyncd.log
2011/12/14 11:58:37 [22377] name lookup failed for XX.XX.XX.XX: Name or service not known
2011/12/14 11:58:37 [22377] connect from UNKNOWN (XX.XX.XX.XX)
2011/12/14 11:58:37 [22377] rsync to html/ from unknown (XX.XX.XX.XX)
解决：需要在服务端这台机上上的/etc/hosts里面添加客户端机的ip和机器名

问题十一： 

[root@Dell-R710 ~]# rsync -artuz -R --delete ./ 192.168.1.233::gex
rsync: failed to connect to 61.145.118.206: Connection refused (111)
rsync error: error in socket IO (code 10) at clientserver.c(124) [sender=3.0.6]
解决：
一、查看防火墙
二、查看服务端是否开启守护进程
ps ax|grep rsync
rsync --daemon --config=/etc/rsyncd.conf

#####################################################################

 

问题1：
在client上遇到问题：
rsync -auzv --progress --password-file=/etc/rsync.pas root@192.168.133.128::backup /home/
rsync: could not open password file "/etc/rsync.pas": No such file or directory (2)
Password: 
@ERROR: auth failed on module backup
rsync error: error starting client-server protocol (code 5) at main.c(1506) [Receiver=3.0.7]
遇到这个问题：client端没有设置/etc/rsync.pas这个文件，而在使用rsync命令的时候，加了这个参数--
password-file=/etc/rsync.pas

问题2：
rsync -auzv --progress --password-file=/etc/rsync.pas root@192.168.133.128::backup /home/
@ERROR: auth failed on module backup
rsync error: error starting client-server protocol (code 5) at main.c(1506) [Receiver=3.0.7]
遇到这个问题：client端已经设置/etc/rsync.pas这个文件，里面也设置了密码111111，和服务器一致，但是
服务器段设置有错误，服务器端应该设置/etc/rsync.pas  ，里面内容root:111111 ,这里登陆名不可缺少

问题3：
rsync -auzv --progress --password-file=/etc/rsync.pas root@192.168.133.128::backup /home/
@ERROR: chdir failed
rsync error: error starting client-server protocol (code 5) at main.c(1506) [Receiver=3.0.7]
遇到这个问题，是因为服务器端的/home/backup  其中backup这个目录并没有设置，所以提示：chdir failed

问题4：
rsync: write failed on "/home/backup2010/wensong": No space left on device (28)
rsync error: error in file IO (code 11) at receiver.c(302) [receiver=3.0.7]
rsync: connection unexpectedly closed (2721 bytes received so far) [generator]
rsync error: error in rsync protocol data stream (code 12) at io.c(601) [generator=3.0.7]
磁盘空间不够，所以无法操作。
可以通过df /home/backup2010 来查看可用空间和已用空间

问题5：网络收集问题
1、权限问题
类似如下的提示：rsync: opendir "/kexue" (in dtsChannel) failed: Permission denied (13)注意查看同步的目录权限是否为755
2、time out
rsync: failed to connect to 203.100.192.66: Connection timed out (110)
rsync error: error in socket IO (code 10) at clientserver.c(124) [receiver=3.0.5]
检查服务器的端口netstat –tunlp，远程telnet测试。


3、服务未启动
rsync: failed to connect to 10.10.10.170: Connection refused (111)
rsync error: error in socket IO (code 10) at clientserver.c(124) [receiver=3.0.5]
启动服务：rsync --daemon --config=/etc/rsyncd.conf


4、磁盘空间满
rsync: recv_generator: mkdir "/teacherclubBackup/rsync……" failed: No space left on device (28)
*** Skipping any contents from this failed directory ***


5、Ctrl+C或者大量文件
rsync error: received SIGINT, SIGTERM, or SIGHUP (code 20) at rsync.c(544) [receiver=3.0.5]
rsync error: received SIGINT, SIGTERM, or SIGHUP (code 20) at rsync.c(544) [generator=3.0.5]


6、xnetid启动
rsync: read error: Connection reset by peer (104)
rsync error: error in rsync protocol data stream (code 12) at io.c(759) [receiver=3.0.5]
查看rsync日志
rsync: unable to open configuration file "/etc/rsyncd.conf": No such file or directory
xnetid查找的配置文件位置默认是/etc下，根据具体情况创建软链接。例如：
ln -s /etc/rsyncd/rsyncd.conf /etc/rsyncd.conf
或者更改指定默认的配置文件路径，在/etc/xinetd.d/rsync配置文件中
