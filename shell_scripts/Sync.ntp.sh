cat /root/ntp.sh
#!/bin/bash
#######################################################
#  Function: Inspection Time
#  Author: davie
#  Date: 2017-12-02
#  Version: 1.0
#  QQ: 178570692
#  Script name: /usr/local/scripts/Sync_NTP.sh
#  http://www.cnblogs.com/bjx2020/
#######################################################
#  List of NTP's servers

ntp_cmd="/usr/sbin/ntpdate"
if [ ! -f "${ntp_cmd}" ]; then
    echo "/usr/sbin/ntpdate does not exists!"
    yum -y install ntp >/dev/null
fi

#NTP服务器数组列表
ntpServer=(
[0]=1231.cn.pool.ntp.org
[1]=0.cn.pool.ntp.org
[2]=2.cn.pool.ntp.org
[3]=3.cn.pool.ntp.org
)
#校验#
serverNum=`echo {#ntpServer[*]}`&#xA0;NUM=0&#xA0;for&#xA0;((i=0;&#xA0;i&lt;=" role="presentation">{#ntpServer[*]}` NUM=0 for ((i=0; i<={#ntpServer[*]}` NUM=0 for ((i=0; i<={#ntpServer[*]}` NUM=0 for ((i=0; iserverNum; i++)); do
    echo -n "正在和NTP服务器:ntpServer[$NUM]&#x6821;&#x9A8C;&#x4E2D;...&quot;/usr/sbin/ntpdate" role="presentation">ntpServer[$NUM]校验中..."/usr/sbin/ntpdatentpServer[$NUM]校验中..."/usr/sbin/ntpdate{ntpServer[$NUM]}校验中..."     /usr/sbin/ntpdate {ntpServer[NUM]}&#xA0;&gt;&gt;&#xA0;/dev/null&#xA0;2&gt;&amp;1&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;if&#xA0;[" role="presentation">NUM]} >> /dev/null 2>&1     if [NUM]} >> /dev/null 2>&1     if [NUM]} >> /dev/null 2>&1     if [ ? -eq 0 ]; then
        echo -e "\e[1;32m\t[成功]\e[0m"
        echo -e "\e[1;32m同步成功,退出......\e[0m"
        break
    else
        echo -e "\e[1;31m\t[失败]\e[0m"
        echo -e "\e[1;31m继续同步下一个!!!!!\e[0m"
        let NUM++
    fi
    sleep 2
done
chmod +x /root/ntp.sh
sh /root/ntp.sh
chmod +x /root/ntp.sh

sh /root/ntp.sh