#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/4/24 12:52
# @Author  : davie
# @Site    : 
# @File    : test
# @Software: PyCharm
"""
数字
字符串
列表
元祖
字典
布尔值

Python3里，不管有多大的数字，都用 int
Python2里，长整型 Long
"""
# ###################### 6个基本魔法 #######################
# join
# split
# find
# upper
# strip
# upper
# lower
# ###################### 灰魔法 #######################
# def check_code():
# 	import random
# 	checkcode = ""
# 	for i in range(4):
# 		current = random.randrange(0,4)
# 		if current != i:
# 			temp = chr(random.randint(65,90))
# 		else:
# 			temp = random.randint(0,9)
# 		checkcode += str(temp)
# 	return checkcode
# code = check_code()
# print(code)

# v = "aeeafafswgrerge"
# v = v.replace("s",'*')
# v = v.replace("a",'*')
# print(v)

# s = ""
# while True:
# 	v1 = input('用户名>> ')
# 	v2 = input('密码>> ')
# 	v3 = input('邮箱>> ')
# 	template = "{0}\t{1}\t{2}\5"
# 	v = template.format(v1,v2,v3)
# 	s = s + v
# 	s_input = input('用户名>> ')
# 	if s_input == "q":
# 		break
# print(s.expandtabs(20))
# list  类，列表
#li = [1,12,9,"age",["史政文",["19",10],"庞贝浪"],"alex",True] # 通过list类创建的对象， li
# 中括号括起来，逗号分隔每个元素，列表中的元素可以是数字，字符串,列表，布尔值...所有的都能放进去

# for

# while
# for item in li:
#     print(item,end=" ")
# li[1] = 120
# li[1] = [11,22,33,44]
# del li[1]
# li[1:3] = [120, 90]
# del li[2:6]
# print(li)
# v = "史政文" in li
# print(v)
#
# name_list = ["alex","seven""eric"]
# # 或者
# name_list = list("alex","seven""eric")
#
# # 创建元组
# ages = (11,22,33,44,55)
# # 或者
# ages = tuple(11,22,33,44,55)
#
# # 创建字典
# person = {"name":"mr.wu","age":18}
# # 或者
# person = dict("name":"mr.wu","age":18)

# count = 0
# li = [11,22,33,44]
# for item in li:
#     if item == 22:
#         continue
#     print(item, end="; ")
#     count += 1
# li = [11,22,33]
# for k,v in enumerate(li):
#     print(k,":",v)
# for x in range(1,10):
#     print(x,end="; ")
#
# # 输出结果为： 1; 2; 3; 4; 5; 6; 7; 8; 9;

# for x in range(30,0,-2):
#     print(x, end="; ")
# # 输出结果为: 30; 28; 26; 24; 22; 20; 18; 16; 14; 12; 10; 8; 6; 4; 2;

"""
# 一、元素分类
# 有如下值集合 [11,22,33,44,55,66,77,88,99,90...]，将所有大于 66 的值保存至字典的第一个key中，
# 将小于 66 的值保存至第二个key的值中。
# 即： {'k1': 大于66的所有值, 'k2': 小于66的所有值}
# """
# items = [11,22,33,44,55,66,77,88,99,90,100,101,111,123]
# under_66 = []
# up_66 = []
# for k,v in enumerate(items):
#     if v <= 66:
#          under_66.append(items[k])
#     else:
#         up_66.append(items[k])
# print(under_66)
# print(up_66)

# """
# 查找列表中元素，移除每个元素的空格，并查找以 a或A开头 并且以 c 结尾的所有元素。
#     li = [" alec", " aric", "Alex", "Tony", "aaic"]
#     tu = ("alec ", " aric", "   Alex", "  Tony", "rain","  Atonyc")
#     dic = {'k1': "alex", 'k2': ' aric',  "k3": "Alex", "k4": "Tony", "k5": " Atonc"}
# """
# li = [" alec", " aric", "Alex", "Tony", "aaic"]
# tu = ("alec ", " aric", "   Alex", "  Tony", "rain","  Atonyc")
# dic = {'k1': "alex", 'k2': ' aric',  "k3": "Alex", "k4": "Tony", "k5": " Atonc"}
# for i,j in enumerate(li):
#     j = j.strip()
#     li[i] = j
#     if (j.startswith('a') or j.startswith('A')) and j.endswith('c'):
#         print(j,end="; ")
# print("\n- - - - - - - - - - - - - - - - - - - - - - - - -")
#
# for i,j in enumerate(tu):
#     j = j.strip()
#     if (j.startswith('a') or j.startswith('A')) and j.endswith('c'):
#         print(j, end="; ")
# print("\n- - - - - - - - - - - - - - - - - - - - - - - - -")
#
# for v in dic.values():
#     v = v.strip()
#     if (j.startswith('a') or j.startswith('A')) and j.endswith('c'):
#         print(j, end="; ")
# print("\n- - - - - - - - - - - - - - - - - - - - - - - - -")
# 元组，元素不可被修改，不能删除和增加
# 推荐在最后添加一个逗号
# tu = (111,"alex",(11,22),[(33,44)],True,33,44,33,33)
# # v = tu[3][0][0]
# v = tu.count(33)
# print(v)
# s = ['F',"a","B","ss","SH",'Bh','DDD','FF']
# count = 0
# for i in s:
#     if i.isupper():
#         count += 1
# print(count)
# info = {
#     "k1":18, # 键值对
#     "k2":True,
#     "k3":[
#         11,
#         [],
#         22,
#         33,
#         {
#             "kk1":"vv1",
#             "kk2":"vv2",
#             "kk3":(11,22)
#         },
#     ],
# }
# # v = info["k1"]
# # v = info["k3"][4]["kk3"][0]
# for k,v in info.items():
#     print(k,v,)
#
# dic = {
#     "k3":"v1",
#     "k2":"v2"
# }
#
# # v = dic.setdefault("k1","123")
# # dic.update(k1="123",k3="v3")
# v = dic.values()
# print(v)

# 1、数字
# int

# 2、字符串
# replace、find、join、strip、startswith、split、upper、format
# template = "I am {name}, age:{age}"
# # v = template.format({"name":"alex","age":19})
# v = template.format(name="alex",age=19)
# print(v)

# 3、列表
# apend、extend、insert
# 索引、切片、循环

# 4、元组

# 5、字典
# get、update、keys、values、items
# for、索引
# dic = {
#     "k1": "v1"
# }
#
# v  = "v1" in dic.values()
# print(v)

# 6、
# 0 、1
# bool
# None、"" 、[] 、()、 {}、0、False

dic = {
    "植物":
        {"草本植物":
            ["牵牛花","瓜叶草","葫芦","翠菊","冬小麦"],
        "木本植物":
            ["乔木","灌木","如松","杉","樟"],
        "水生植物":
            ["菊花","干厨菜","菖蒲","水葱","再力花","梭鱼草"]},
    "动物":
        {"两栖动物":
            ["山龟","山鳌","石蛙","娃娃鱼","蟾蜍","龟","鳄鱼","蜥蜴","蛇"],
        "禽类":
            ["雏鸡","原鸡","长鸣鸡","昌国鸡","斗鸡","长尾鸡","乌骨鸡"],
        "哺乳类动物":
            ["虎","狼","鼠","貂","猴","树懒","斑马","狗"]}}
li = []
go = True
while go:
    for i,v in enumerate(dic,1):
        print(i,v)
        li.append(v)
    u_c = input(">>>")

    if u_c == "b":
        li.clear()
        break
    elif u_c == "q":
        go = False
        break
    u_c = int(u_c)

    li1 =[]
    while go:
        for i,v in enumerate(dic[li[u_c-1]],1):
            print(i,v)
            li1.append(v)

        u_c1 = input(">>>>")
        if u_c1 == "b":
            li1.clear()
            break
        elif u_c1 == "q":
            go = False
            break
        u_c1 = int(u_c1)

        while go:
            for i in dic[li[u_c-1]][li1[u_c1-1]]:
                print(i)
            u_c2 = str(input(">>>>>"))
            u_c2 = u_c2.lower()
            if u_c2 == "b":
                li1.clear()
                break
            elif u_c2 == "q":
                go = False
                break