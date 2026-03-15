# option 1
s = "Hello"

# string[start:stop:step]
print(s[::-1])

# option 2
reversed_word = s[::-1]
print(reversed_word)

# option 3
reversed_word = "".join(reversed(s))
print(reversed_word)