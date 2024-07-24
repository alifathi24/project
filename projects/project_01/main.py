print("Welcome to Calculator")

num1 = float(input("Enter first digit: "))
num2 = float(input("Enter second digit: "))

operation = input("Enter 'add', 'sub', 'multiple' or 'divide': ")

if operation == 'add':
  result = num1 + num2
  print(f'{num1} + {num2} = {result}')
elif operation == 'sub':
  if num1 > num2:
    result = num1 - num2
    print(f'{num1} - {num2} = {result}')
  else:
    result = num2 - num1
    print(f'{num2} - {num1} = {result}')
elif operation == 'multiple':
  result = num1 * num2
  print(f'{num1} * {num2} = {result}')
elif operation == 'divide':
  result = num1 / num2
  print(f'{num1} / {num2} = {result}')
else:
  print("Error! please try again")
