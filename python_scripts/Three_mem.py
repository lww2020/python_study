#!/usr/bin/env python3
# -*- coding:utf-8 -*-

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
    else:
        u_c = int(u_c)
    u_c = int(u_c)
    li1 = []
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
        else:
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
