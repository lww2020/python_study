#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# age = 20
# if age >= 18:
#     print('your age is', age)
#     print('adult')


# age = 3
# if age >= 18:
#     print('your age is', age)
#     print('adult')
# else:
#     print('your age is', age)
#     print('teenager')

# age = 3
# if age >= 18:
#     print('adult')
# elif age >= 6:
#     print('teenager')
# else:
#     print('kid')

# -*- coding: utf-8 -*-
"""

小明身高1.75，体重80.5kg。请根据BMI公式（体重除以身高的平方）帮小明计算他的BMI指数，并根据BMI指数：

    低于18.5：过轻
    18.5-25：正常
    25-28：过重
    28-32：肥胖
    高于32：严重肥胖

"""
height = 1.75
weight = 80.5
BMI = int(weight / (height **2))
#BMI = 32
print(BMI)
if BMI <= 18.5:
    print('过轻')
elif BMI <= 25:
    print('正常')
elif BMI <= 28:
    print('过重')
elif BMI <= 32:
    print('肥胖')
elif MBI >= 32:
    print('严重肥胖')
