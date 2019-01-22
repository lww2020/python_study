#/usr/bin/env python3
# -*- coding:utf-8 -*-
pv = int(input("请输入每天的总PV数: "))

results ="""
原理：每天80%的访问集中在20%的时间里，这20%时间叫做峰值时间
公式：( 总PV数%s * 80% ) / ( 每天秒数% * 20% ) = 峰值时间每秒请求数(QPS)
机器：峰值时间每秒QPS / 单台机器的QPS = 需要的机器

问：每天300w PV 的在单台机器上，这台机器需要多少QPS？
答：( 3000000 * 0.8 ) / (86400 * 0.2 ) = 139 (QPS)

问：如果一台机器的QPS是58，需要几台机器来支持？
答：139 / 58 = 3 
    """
s_qps = ( pv * 0.8)/(86400 * 0.2 )
sum = int(s_qps/8000)
print(s_qps)
print(sum)