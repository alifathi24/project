import random
choices = ["rock", "paper", "scissors"]

computer_choice = random.choice(choices)
user_choice = input("Enter rock, paper, or scissors: ").lower()

print(f"Computer chose: {computer_choice}")
print(f"You chose: {user_choice}")

if computer_choice == user_choice:
    print("It's a tie!")
elif computer_choice == "scissors" and user_choice == "rock":
    print("You win!")
elif computer_choice == "rock" and user_choice == "paper":
    print("You win!")
elif computer_choice == "paper" and user_choice == "scissors":
    print("You win!")
else:
    print("You lose!")