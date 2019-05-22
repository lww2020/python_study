#!/usr/bin/env python
"""
   1 如果：女人的年龄>30岁，那么：叫阿姨
"""
# go = True
# while go:
#     age_of_girl = input("请输入年龄: >>")
#     if  age_of_girl.isdigit():
#         age_of_girl = int(age_of_girl)
#     else:
#         if age_of_girl.lower() == "q":
#             print("你输入了q，已退出！")
#             go == "False"
#         else:
#             print("你输入的年龄有误")
#             go == "False"
#         exit()
#     if age_of_girl > 30:
#         print("阿姨,你好！")
#     else:
#         print("姑娘,你好！")
"""
4 如果：成绩>=90，那么：优秀

       如果成绩>=80且<90,那么：良好

       如果成绩>=70且<80,那么：普通

       其他情况：很差
"""

# score=input('请输入成绩>>: ')
# score=int(score)
# if score >= 90:
#     print("优秀")
# elif score>= 80:
#     print("良好")
# elif score >= 70:
#     print("普通")
# else:
#     print("很差")

# 如果:今天是Monday,那么:上班
# 如果:今天是Tuesday,那么:上班
# 如果:今天是Wednesday,那么:上班
# 如果:今天是Thursday,那么:上班
# 如果:今天是Friday,那么:上班
# 如果:今天是Saturday,那么:出去浪
# 如果:今天是Sunday,那么:出去浪

# xing_qi = (
#     'Monday',
#     'Tuesday',
#     'Wednesday',
#     'Thursday',
#     'Friday',
#     'Saturday',
#     'Sunday'
# )
# today=input("请输入星期:>>")
# if today in ['Saturday','Sunday']:
#     print("出去浪...")
# elif today in ['Monday','Tuesday','Wednesday','Thursday','Friday']:
#     print("工作日")
# else:
#     print('必须选择其中一个:',xing_qi)

#打印0-10
# count = 0
# while count<10:
#     count += 1
#     print('loop: ',count)

# 打印0-10之间的偶数
# count = 0
# while count <=10:
#     if (count % 2) == 0:
#         print(count)
#     count += 1
# 打印0-10之间的奇数
# count = 0
# while count <=10:
#     if (count % 2) != 0:
#         print(count)
#     count += 1
"""
#练习，要求如下：
    1 循环验证用户输入的用户名与密码
    2 认证通过后，运行用户重复执行命令
    3 当用户输入命令为quit时，则退出整个程序 
"""
# name='a'
# password='123'
#
# tag = True
# while tag:
#     print("提示：输入q退出")
#     inp_name = input("用户名: ")
#     if inp_name == 'q':
#         exit("你选择了退出")
#     elif inp_name == name:
#         inp_password = input("密码:")
#         if  inp_password.lower() == 'q':
#             exit("你选择了退出")
#         elif inp_password == password:
#             exit("成功登陆")
#             while tag:
#                 print("提示：输入q退出")
#                 inp_name = input("用户名: ")
#                 if inp_name == name:
#                     inp_password = input("密码:")
#                     if inp_password == password:
#                         exit("成功登陆")
#                     elif inp_password.lower() == 'q':
#                          break
#                     elif inp_password != password:
#                         exit("密码错误")
#                     else:
#                         exit("密码错误")
#                 else:
#                     exit("用户名错误")
#         else:
#             print("密码错误")
#     else:
#         exit("用户名输入错误")

#与其它语言else 一般只与if 搭配不同，在Python 中还有个while ...else 语句，
#while 后面的else 作用是指，当while 循环正常执行完，中间没有被break 中止的话，
# 就会执行else后面的语句

# count = 0
# while count < 5:
#     count += 1
#     if count == 3:
#         break
#     print("Loop", count)
# else:
#     print("循环正常执行完毕")
# print("-----out of while loop ------")

# 1. 使用while循环输出1 2 3 4 5 6     8 9 10
# count = 1
# while count<=10:
#     if count == 7:
#         pass
#     else:
#         print(count)
#     count += 1

# # 求1-100的所有数的和
# count = 0
# sum = 0
# while count<= 100:
#     sum = sum + count
#     count += 1
# print(sum)
# 输出 1-100 内的所有奇数
# count = 0
# while count <=100:
#     print(count)
#     count += 1
# tpl = "I am {}, age {}, {}".format("seven",18,'alex')
# tpl = "I am {2}, age {1}, {0}".format("seven",18,'alex')
# tpl = "I am {name}, age {age}, realy {name}".format(name="seven",age=18)
# tpl = "I am {name}, age {age}, realy {name}".format(**{"name":"alex","age":20})
tpl = "I am {:s}, age {:d}".format(*["alex",20])
print(tpl)