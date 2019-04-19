#!/usr/bin/env python
# -*- coding:utf8 -*-
"""
输出1-100内所有的奇数
"""
n = 1
while n < 101:
    if (n % 2) == 1:
        print(n)
    n = n + 1
print('---------- Done ----------')
