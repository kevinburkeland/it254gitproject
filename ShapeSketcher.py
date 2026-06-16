import turtle
import time

#functions
def draw_square(t, size= 100, color = "red"):
    t.color(color)
    for _ in range(4):
        t.forward(size)
        t.right(90)

def draw_triangle(t, size= 100, color = "green"):
    t.color(color)
    for _ in range(3):
        t.forward(size)
        t.right(120)

def draw_circle(t, radius= 50, color= "green"):
    t.color(color)
    t.circle(radius)

def multiple_shape_sketcher():
    screen = turtle.Screen()
    screen.setup(width= 600, height= 600)
    screen.title("Multiple Shape Drawer")
    screen.bgcolor("light green")

    t = turtle.Turtle()
    t.pensize(3)
    t.speed(5)

    print("What shape would you like me to draw?")
    print("Shapes: 1. Square,2. Circle,3. Triangle")

    #shape = screen.textinput("shape Sketcher", "Enter Shape")
    shape = screen.textinput("shape Sketcher", "What shape would you like me to draw?")
    #quantity = screen.textinput("shape quantity", "How many would you like me to draw?")
    

    if shape == "Square" or shape == '1':
        t.penup()
        t.goto(-50,50)
        t.pendown()
        draw_square(t)
        
    elif shape == "Triangle" or shape == '3':
        t.penup()
        t.goto(-50,50)
        t.pendown()
        draw_triangle(t)
        
    elif shape == "Circle" or shape == '2':
        t.penup()
        t.goto(-50,50)
        t.pendown()
        draw_circle(t)
        
    else :
        t.color("red")
        t.penup()
        t.goto(0,0)
        t.write("Invalid Shape", align="center", font= "Arial")
        
# Execute the function
if __name__ == "__main__":
    multiple_shape_sketcher()
