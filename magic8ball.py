import random

def magic_8_ball():
    responses = [
        "Yes, definitely.",
        "No way.",
        "Ask again later.",
        "Without a doubt.",
        "Very unlikely.",
        "It is certain.",
        "Don't count on it.",
        "Absolutely.",
        "Maybe... depends on your effort.",
        "My sources say no."
    ]

    question = input("Ask the Magic 8-Ball a yes or no question: ")
    print("\n🎱", random.choice(responses))

if __name__ == "__main__":
    magic_8_ball()
