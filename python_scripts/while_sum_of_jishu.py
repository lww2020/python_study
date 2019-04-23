#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/4/23 10:35
# @Author  : davie
# @Site    : 
# @File    : while_sum_of_jishu.py
# @Software: PyCharm

"""
求 1-2+3-4+5...+99所有数字之和
"""
n = 1
sum = 0
while n <= 99:
    temp = n % 2
    if temp == 0:
        sum -= n
    else:
        sum += n
    n += 1
print(sum)
print('***** Done *****')
