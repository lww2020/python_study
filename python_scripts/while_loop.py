#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/4/23 9:55
# @Author  : davie
# @Site    : 
# @File    : while_loop.py.py
# @Software: PyCharm

"""
1、使用while循环输出 1,2,3,4,5， ,7,8,9,10
"""
numbers = 1
while numbers <= 10:
    if numbers == 6:
        pass
    else:
        print(numbers)
    numbers += 1
print('***** Done *****')