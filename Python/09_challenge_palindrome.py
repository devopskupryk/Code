string = "null"
while not (string == "exit"):
    string = input("Enter the string to test if it's palindrome of 'exit'")
    print(string)
    palindrom = string[::-1]
    print(palindrom)
    if string == palindrom:
        print("Palindrome test: True")
    else:
        print("Palindrome test: False")
