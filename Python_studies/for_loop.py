#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# sum = 0
# for i in range(101):
#     sum = sum + i
# print(sum)

# sum = 0
# n = 99
# while n > 0:
#     sum = sum + n
#     n -= 2
# print(sum)

# n = 1
# while n <= 100:
#     print(n)
#     n += 1
# print('END')

# n = 1
# while n <= 100:
#     if n > 10: # 当n=1时，条件满足，执行break语句
#         break # break语句会结束当前循环
#     print(n)
#     n += 1

n = 0
while n < 20:
    n += 1
    if (n % 2 ) == 0: # 偶数
        continue
    print(n)
