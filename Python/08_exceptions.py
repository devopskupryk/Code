
# Errors can happen in programs, and we need a clean way to handle them
# TODO: This code will cause an error because you can't divide by zero:
#x = 10 / 0

# TODO: Exceptions provide a way of catching errors and then handling them in 
# a separate section of the code to group them together
try:
    x = 10 / 0
except:
    print("Well that's didn't work")

# TODO: You can also catch specific exceptions
try:
    answer = input("What should I devide 10 by?")
    num = int(answer)
    print(10/num)
except ZeroDivisionError as e:
    print("You can't devide by zero")
except ValueError as e:
    print("You didn't give me a valid number.",e)
finally:
    print("This code runs always")
