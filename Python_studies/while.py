#!/usr/bin/env python3
# -*- coding:utf-8 -*-
#
number = 23
running = True

while running:
    guess = int(input('Enter an integer: '))

    if guess == number:
        print('Congratulations, you guessed it.')
        # 这将导致while终止
        running = False
    elif guess < number:
        print('No, it is a little higher than that.')
    else:
        print('No, it is a little lower than that.')
else:
    print('The while loop is over.')
    # 在这里你可以做你想做的任何事
print('Done')
