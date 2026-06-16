import turtle
import random

s = turtle.Screen()
s.colormode(255)
t = turtle.Pen()
t.speed(10)
r = 255
g = 0
b = 0
t.pencolor(r, g, b)
t.width(3)

state = 0
# full red
# green increases 0
# red fades 1
# blue increases 2
# green fades 3
# red increases 4
# blue fades 5
# repeat


while True:
    if state == 0:
        if g >= 255:
            state = 1
        else:
            g += 1
    elif state == 1:
        if r >= 0:
            state = 2
        else:
            r -= 1
    elif state == 2:
        if 
    

    t.pencolor(r, g, b)
    t.forward(10)
    x,y=t.position()
    h=t.heading()
    z=random.randint(-45, 45)
    if x >= 200:
        t.setheading(180)
        t.right(z)
    elif x <= -200:
        t.setheading(0)
        t.left(z)
    elif y >= 200:
        t.setheading(270)
        t.right(z)
    elif y <= -200:
        t.setheading(90)
        t.left(z)
    # print(x, y, h)