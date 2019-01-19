#!/usr/bin/env python3
# -*- coding:utf-8 -*-
#
number = 23
guess = int(input('Enter an integer: '))

if guess == number:
    # 新块从这里开始
    print('Congratulations, you guessed it.')
    print('but you do not win any prizes!')
    # 新块从这里结束
elif guess < number:
    # 另一代码块
    print('No, it is a little higher than that')
    # 你可以在此做任何你希望在该代码块内进行的事情
else:
    print('No, it is a little lower than that')
    # 你必须通过测试一个大于(>)设置数的数字来到这里。

print('Done')
# 这最后一行语句将在
# if 语句执行完毕后执行。
