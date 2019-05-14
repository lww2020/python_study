#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/4/23 10:44
# @Author  : davie
# @Site    :
# @File    : while_three_time.py.py
# @Software: PyCharm
"""
三元运算
# 书写格式
result = 值1 if 条件 else 值2
如果条件成立，那么将"值1"赋值给result变量，否则，将"值2"赋值给result变量
"""

# # #####  定义函数  #####
# # name 叫做函数func的形式参数，简称形参
# def func(name):
#     print(name)
#
# # #####  执行函数 #####
# # "wupeiqi" 叫做函数func的实际参数.简称实参
# func("wupeuqi")

def func(name,age=18):
    print("%s:%s"%(name,age))

# 指定参数
# func("wupeiqi",19)
# 使用默认参数
func("alex","浙江")

# 注意：默认参数需要放在参数列表最后