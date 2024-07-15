def add():
    n = int(input("Enter now many numbers you want to add : "))
    L = []
    ans=0
    for i in range(1, n+1):
        if i == 1:
            k = int(input("Enter the 1st number : "))
        elif i == 2:
            k = int(input("Enter the 2nd number : "))
        elif i == 3:
            k = int(input("Enter the 3rd number : "))
        else:
            k = int(input(f"Enter the {i}th number : ")) 
        L.append(k)
    for i in L:
        ans+=i 
    return ans

def sub():
    a = int(input("Enter the first number : "))
    b = int(input("Enter the second number : "))
    return a-b

def mul():
    n = int(input("Enter how many numbers you want to multiply : "))
    L = []
    ans=1
    for i in range(1, n+1):
        if i == 1:
            k = int(input("Enter the 1st number : "))
        elif i == 2:
            k = int(input("Enter the 2nd number : "))
        elif i == 3:
            k = int(input("Enter the 3rd number : "))
        else:
            k = int(input(f"Enter the {i}th number : ")) 
        L.append(k)
    for i in L:
        ans*=i 
    return ans

def div():
    a = int(input("Enter the first number : "))
    b = int(input("Enter the second number : "))
    try:
        return a/b
    except ZeroDivisionError:
        print("You cannot divide by zero.")
    except:
        print("Some unknown error")

def exp(check):
    x=int(input("Enter x : "))
    n=int(input("Enter y : "))
    if check:
        return pow(x, n)
    else:
        if n==0:
            print("Enter a number other than 0.")
        else:
            return pow(x, 1/n)

while True:
    try:
        print("Enter 1 to add numbers.")
        print("Enter 2 to subtract 2 numbers.")
        print("Enter 3 to multiply numbers.")
        print("Enter 4 to divide 2 numbers.")
        print("Enter 5 to calculate x^n.")
        print("Enter 6 to calculate x^(1/n).")
        print("Enter anything else to exit.")
        operationType = int(input("Enter here : "))
        
        if operationType == 1:
            ans = add()
            print(f"The sum of the numbers you entered is {ans}.")
        elif operationType == 2:
            ans = sub()
            print(f"The subtraction of both the numbers is {ans}.")
        elif operationType == 3:
            ans=mul()
            print(f"The product of the numbers you entered is {ans}.")
        elif operationType == 4:
            ans=div()
            print(f"The result of division is {ans}.")
        elif operationType == 5:
            ans=exp(1)
            print(f"x raised to power n is {ans}.")
        elif operationType == 6:
            ans=exp(0)
            print(f"The value of x^(1/n) is {ans}.")
        else:
            break
    except:
        print("Some unknown error. EXIT")
        break