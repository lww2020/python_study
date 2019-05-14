#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/4/23 10:44
# @Author  : davie
# @Site    :
# @File    : while_three_time.py.py
# @Software: PyCharm
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
go = True
while go:
    li = []
    for i,v in enumerate(dic,1):
        print(i,v)
        li.append(v)
    u_c = str(input(">>>"))  # 1
    if u_c.isdigit():
        ...
    elif u_c.isalpha():
        u_c = u_c.lower()
        if u_c == "i":
            lx = input("类型: ")
            if dic.get(lx, 1) == 1:
                dic[lx] = {}
            zl = input("种类: ")
            if dic[lx].get(zl, 1) == 1:
                dic[lx][zl] = []
            while go:
                mc = input("名称: ")
                if mc == "q":
                    li.clear()
                    break
                if mc in dic[lx][zl]:
                    print("已经存在")
                else:
                    dic[lx][zl].append(mc)