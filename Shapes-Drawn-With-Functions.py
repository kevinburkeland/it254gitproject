import ipyturtle3 as turtle
from ipyturtle3 import hold_canvas
from IPython.display import display
import sys
import math

# Ponty Mython and the Goly Hrale type script
#longest script in the world :(

# 1. Create the drawing canvas widget thing optimized for Jupyter browser window
canvas = turtle.Canvas(width=600, height=600)
display(canvas)

# 2. Setup the Screen and Turtle
screen = turtle.TurtleScreen(canvas)
t = turtle.Turtle(screen)
t.speed(0)

# fun-ctions ripped from the rocket.ipy script
# draws a rectangle using a given width and height
def rect(w, h):
    t.forward(w)
    t.right(90)
    t.forward(h)
    t.right(90)
    t.forward(w)
    t.right(90)
    t.forward(h)
    t.right(90)
#draws a triangle using a given line length
def tri(l):
    for _ in range(3):
        t.right(120)
        t.forward(l)
# draws a right-angle triangle for the rocket fins
def r_tri(a, b, orientation="up"):
    start_pos = t.pos() #remember starting point
    t.forward(a)
    t.penup()
    pos = t.pos()
    t.backward(a)
    t.pendown()
    if orientation == "up":
        t.right(-90)
    else:
        t.right(90)
    t.forward(b)
    t.goto(pos) # draw the hypotenuse back to the point
    t.penup()
    t.goto(start_pos) # return to initial spot
    t.pendown()

#combines rectangles, triangles, and a circle to assemble the whole rocket
def rocket(h=50, w=35, fin_p=5, fin_h=20, fin_w=8, win_p=5, win_r=8):
    rect(w, h) # body
    t.right(180)
    tri(w) # nose cone
    t.penup()
    t.left(90)
    t.forward(h-fin_p)
    t.pendown()
    t.right(90)
    r_tri(fin_w, fin_h, orientation="down") # left fin
    t.penup()
    t.right(90)
    t.forward(w)
    t.pendown()
    r_tri(fin_w, fin_h) # right fin
    t.penup()
    t.forward(h-fin_p-win_p)
    t.left(90)
    t.forward(w/2)
    t.pendown()
    t.circle(win_r) # window

# draws a standard 4 sided square based on user input
def draw_square(size):
    """Draws a standard square."""
    for _ in range(4):
        #t.circle(size)
        t.forward(size)
        t.left(90)
# draws an equilateral 3 sided triangle based on user input
def draw_triangle(size):
    """Draws an equilateral triangle."""
    for _ in range(3):
        t.forward(size)
        t.left(120)
# translates user size input into a scaling multiplier
def draw_instructor_rocket(size):
    """Scales the rocket code relative to the user's size choice."""
    
    # Base baseline is h=50. used this to scale all other parts proportionally.
    scale = size / 50.0
    
    # pass 'scaled numbers' into the rocket function
    rocket(
        h=size,
        w=int(35 * scale),
        fin_p=int(5 * scale),
        fin_h=int(20 * scale),
        fin_w=int(8 * scale),
        win_p=int(5 * scale),
        win_r=int(8 * scale)
    )

# start of main loop with special message
print("Stop! Who would cross the Bridge of Death must answer me these questions three, ere a python grade I'll see...")

# use while loop to keep running the game until the user types the break command

while True:
    # QUESTION 1: The Shape (or Quit)
    print("\n--- The Keeper's Query ---")
    choice = input("What would you like to draw? (S)quare, (T)riangle, (R)ocket, or (Q)uit: ").upper().strip()

    # Immediate Exit Check: if Q is typed then end the loop 'safely'
    if choice == 'Q':
        print("You have passed safely! Safe travels across the gorge.")
        break

    # Input Validation: if user typed an ivalid letter, clear screen and kill execution
    if choice not in ['S', 'T', 'R']:
        print("\n*Aaauughhh!* You didn't give a proper option! *Whoosh*")
        print("The Keeper hurls you into the Chasm of Eternal Peril!")
        screen.clear()
        sys.exit()

    # QUESTION 2, 3, & 4: Coordinates and Size to try to stay inside the bounds of the viewport
    try:
        x_pos = int(input("Where would you like to draw it along the X axis? (-300 to 300): "))
        y_pos = int(input("Where would you like to draw it along the Y axis? (-300 to 300): "))
        size = int(input("How big would you like the shape to be? (e.g., 50): "))
        #error handling for if the user types letter or symbols instead of integers (triggers a crash)
    except ValueError:
        print("\n*Aaauughhh!* That wasn't a valid integer!")
        print("You are cast into the Gorge of Eternal Peril!")
        screen.clear()
        sys.exit()

    # Teleport the turtle to the chosen location
    t.penup()
    t.goto(x_pos, y_pos)
    t.setheading(0)  #Resets the turtle facing right so the next drawing isn't sideways
    t.pendown()

    # Call the correct function based on input
    if choice == 'S':
        draw_square(size)
    elif choice == 'T':
        draw_triangle(size)
    elif choice == 'R':
        draw_instructor_rocket(size)

print("\nProgram finished successfully.")