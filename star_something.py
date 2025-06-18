import random

responses = {
    "picard": [
        "Picard: I will not bow to tyranny, Emperor.",
        "Picard: The Federation stands for diplomacy, not domination.",
        "Picard: Make it so.",
        "Picard: There are four lights!",
    ],
    "palpatine": [
        "Palpatine: The dark side is a pathway to many abilities some consider to be… unnatural.",
        "Palpatine: Give in to your anger. Let the hate flow through you!",
        "Palpatine: I am the Senate!",
        "Palpatine: You will find that resisting the Empire is… futile.",
    ],
    "jarjar": [
        "Jar Jar: Ohhh, missa not likin' dis one bit!",
        "Jar Jar: Yousa havin' a real bad day, huh?",
        "Jar Jar: Oopsie! Meesa step in some space trouble!",
        "Jar Jar: Dis is bombad diplomacy!",
    ],
    "q": [
        "Q: Oh, Jean-Luc, you really do find yourself in the strangest predicaments.",
        "Q: Why waste time negotiating? Let’s fast forward to the moment you inevitably triumph.",
        "Q: Picard, I could *snap* and make him vanish, but where’s the fun in that?",
        "Q: The game, as always, is mine to control.",
    ],
}

def galactic_duel():
    print("A cosmic anomaly has brought Captain Picard face-to-face with Emperor Palpatine.")

    while True:
        action = input("Type 'debate', 'resist', 'dark side', or 'exit': ").lower()

        if action == "debate":
            print(random.choice(responses["picard"]))
            print(random.choice(responses["palpatine"]))
        elif action == "resist":
            print("Picard: The Federation does not succumb to fear.")
            print("Palpatine: Fear leads to power. Power leads to control.")
            print("Suddenly, Q appears in a flash of light!")
            print(random.choice(responses["q"]))
        elif action == "dark side":
            print("Palpatine grins wickedly, expecting Picard to surrender.")
            print("Before he can respond, Jar Jar Binks stumbles into the scene!")
            print(random.choice(responses["jarjar"]))
        elif action == "exit":
            print("The strange encounter dissolves into legend. Picard straightens his uniform.")
            print("Picard: Q, I assume this was your doing?")
            print("Q: Oh Jean-Luc, must you always blame me? Farewell!")
            break
        else:
            print("Invalid command. Try again!")

galactic_duel()
