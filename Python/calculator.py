def add():
    n = int(input("Enter the no. of numbers you want to add : "))
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
    n = int(input("Enter the no. of numbers you want to multiply : "))
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

print("Enter 1 to add numbers.")
print("Enter 2 to subtract 2 numbers.")
print("Enter 3 to multiply numbers.")
print("Enter 4 to divide 2 numbers.")

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