#!/bin/bash

# Makes a random number between 1 and 10
secret_number=$(( $RANDOM % 10 + 1 ))

# Start the number of guesses
GUESSES=3
  echo "Welcome to the Number Guessing Game!"
  echo "Guess the number between 1 and 10."
while [[ $GUESSES -ge 0 ]]; do
  if [[ $GUESSES -eq 0 ]]; then
    echo "Game over"
    sleep 3
    exit
  fi

  echo "You have $GUESSES"
  read -p "Enter your guess: " guess

  # Check if the input is a number
  if ! [[ "$guess" =~ ^[0-9]+$ ]]; then
    echo "That is not a number Sir, try again."
    continue
  fi

  # Increment the number of guesses
  GUESSES=$((GUESSES - 1))

  # Compare the guess to the secret number
  if [ "$guess" -lt "$secret_number" ]; then
      echo "Too low!"
  elif [ "$guess" -gt "$secret_number" ]; then
      echo "Too high!"
  else
      echo "Congratulations! You guessed the number."
      break
  fi
done
