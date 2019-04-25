#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/4/24 12:52
# @Author  : davie
# @Site    : 
# @File    : test
# @Software: PyCharm
"""
数字
字符串
列表
元祖
字典
布尔值

Python3里，不管有多大的数字，都用 int
Python2里，长整型 Long
"""
# ###################### 6个基本魔法 #######################
# join
# split
# find
# upper
# strip
# upper
# lower
# ###################### 灰魔法 #######################
# def check_code():
# 	import random
# 	checkcode = ""
# 	for i in range(4):
# 		current = random.randrange(0,4)
# 		if current != i:
# 			temp = chr(random.randint(65,90))
# 		else:
# 			temp = random.randint(0,9)
# 		checkcode += str(temp)
# 	return checkcode
# code = check_code()
# print(code)

# v = "aeeafafswgrerge"
# v = v.replace("s",'*')
# v = v.replace("a",'*')
# print(v)

s = ""
while True:
	v1 = input('用户名>> ')
	v2 = input('密码>> ')
	v3 = input('邮箱>> ')
	template = "{0}\t{1}\t{2}\5"
	v = template.format(v1,v2,v3)
	s = s + v
	s_input = input('用户名>> ')
	if s_input == "q":
		break
print(s.expandtabs(20))