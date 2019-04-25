#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/4/24 12:52
# @Author  : davie
# @Site    : 
# @File    : test
# @Software: PyCharm

"""
1、运算符
+、-、*、/、//、%

2、判断某个东西是否在某个东西里面包含
in、not in

数字
字符串
布尔值：True 真、False 假

==、>、<、>=、<=、!=
not
and
or


in
not in

推荐使用括号，执行顺序为从前到后
True OR => True
True AND 继续下一个判断
False OR => 继续下一个
False AND => False


count = count +1
等价于: count += 1

count = count - 1
count -= 1

count = count * 1
count *= 1

count = count / 1
count /= 1

count = count / /1
count //= 1

count = count % 1
count %= 1

数字
字符串
列表
元祖
字典
布尔值

"""
"""
Python3里，不管有多大的数字，都用 int
Python2里，长整型 Long
"""
# a = 'test'
#
# # v = a.capitalize() # 首字母大写
# # v = a.casefold() # 所有的都变小写(更强大)
# # v = a.lower() # 所有的都变小写
# v = a.center(30, '#') # 30代表长度，#代表空白未知填充字符串
# v1 = a.center(30, )
# v2 = a.center(30, '-')
# print(v)
# print(v1)
# print(v2)

test = "I am {name}, age {age}"
v = test.format_map({"name":"alex","age":23})

print(v)
