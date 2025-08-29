# TODO: import random module
import random

#TODO: Ask the user for number to guess
num = int(input("Enter a number: "))
#TODO: Generator random 
random_choice = random.randint(0, 101)
print(random_choice)

if random_choice > num:
    print(f"You guessed {num}")
    print(f"The number is {random_choice}")
    print("Please try again!")
elif random_choice < num:
    print(f"You guessed {num}")
    print(f"The number is {random_choice}")
    print("Please try again!")
elif random_choice == num:
    print(f"You guessed {num}")
    print(f"The number is {random_choice}")
    print("You got it!")
else:
    print("Please try again!")