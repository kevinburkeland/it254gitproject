import turtle

# Set up the screen
screen = turtle.Screen()
screen.setup(width=600, height=600)
screen.bgcolor("lightblue")
screen.title("Abstract Mona Lisa - Turtle Graphics")

# Create a turtle object
pen = turtle.Turtle()
pen.speed(0) # Fastest speed
pen.penup()

# Draw the head (oval shape)
pen.goto(0, -100)
pen.pendown()
pen.fillcolor("#F0D9B5") # Skin tone
pen.begin_fill()
pen.circle(150, steps=20) # Approximate an oval
pen.end_fill()
pen.penup()

# Draw the hair (darker oval)
pen.goto(0, 50)
pen.pendown()
pen.fillcolor("#5A4B4B") # Dark brown
pen.begin_fill()
pen.circle(100, steps=20)
pen.end_fill()
pen.penup()

# Draw the eyes (simple dots)
pen.goto(-50, 100)
pen.pendown()
pen.dot(10, "black")
pen.penup()
pen.goto(50, 100)
pen.pendown()
pen.dot(10, "black")
pen.penup()

# Draw the nose (simple line)
pen.goto(0, 120)
pen.pendown()
pen.setheading(270) # Point downwards
pen.forward(30)
pen.penup()

# Draw the mouth (simple curve)
pen.goto(-15, 60)
pen.pendown()
pen.pencolor("black")
pen.pensize(3)
pen.setheading(0)
pen.circle(30, 60) # Arc for a subtle smile
pen.penup()

# Hide the turtle and keep the window open
pen.hideturtle()
screen.mainloop()
