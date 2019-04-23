#!/usr/bin/env python
# -*- coding:utf8 -*-
# """
#
# """
n = 1
sum = 0
while n < 100:
    temp = n % 2
    if temp == 0:
        sum = sum - n
    else:
        sum = sum + n
    n = n + 1
print(sum)
