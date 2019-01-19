#!/usr/bin/env python3
# -*- coding:utf-8 -*-
#
while True:
    s = input('Enter something: ')
    if s == 'quit':
        break
    if len(s) < 3:
        print('Too small')
        continue
    print('Input is of sufficient length')
    # 至此此处继续进行气他任何处理