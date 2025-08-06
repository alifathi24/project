num1 = int(input("Enter first digit?\n"))
num2 = int(input("Enter second digit?\n"))
operation = input("Choose operation: add, substract, multiply, and divide\n")

if operation == 'add':
    print(f"the addition of {num1} + {num2} = {(num1 + num2)}")
elif operation == 'substract':
    if num1 > num2:
        print(f"the subraction of {num1} - {num2} = {(num1 - num2)}")
    else:
        print(f"the addition of {num2} - {num1} = {(num2 - num1)}")
elif operation == 'multiply':
    print(f"the multiplication of {num1} * {num2} = {(num1 * num2)}")

elif operation == 'divide':
    print(f"the division of {num1} / {num2} = {(num1 / num2)}")
else:
    print("Error: please choose the right operation")