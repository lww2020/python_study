#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/4/23 10:07
# @Author  : davie
# @Site    : 
# @File    : while_sum_1_100.py.py
# @Software: PyCharm
"""
求1到100之间的和
"""
n = 1
sum = 0
while n <= 100:
    sum += n
    n += 1
print(sum)

print('***** Done *****')