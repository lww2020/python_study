#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/4/23 10:44
# @Author  : davie
# @Site    : 
# @File    : while_three_time.py.py
# @Software: PyCharm
"""
用户只有三次重试机会
"""
n  = int(1)
username = 'davie'
password = 'davie123'

while n <= 3:
    username_input = input("第%s次,请输入用户名:> "%(n))
    password_input = input("第%s次,请输入密码:> "%(n))
    if username_input == username and password_input == password:
        print('输入第%s次，恭喜你登录成功.'%n)
        break
    else:
        if username_input != username:
            print('第%s次输入的用户名错'%n)
        elif password_input != password:
            print('第%s次输入的密码错误'%n)
        else:
            print('第%s次输入的用户名和密码都错误'%n)
        if n == 3:
            exit('你已经连续%s次用户名或密码输入错误,程序退出'%n)
    n += 1
print('***** Done *****')