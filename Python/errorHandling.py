def errorHandler():
    try:
        a=int(input("Enter a number : "))
        b=int(input("Enter a number : "))
        ans=a/b
    except ValueError:
        print("Please enter a numeric value in both the fields.")
        return 0
    except ZeroDivisionError: 
        print("Sorry! Cannot divide by zero. ") 
        return 0
    except:
        print("Some unknown error.")
    else:
        print(f"The result of division is {ans}.")
        return 1
    finally:
        print("This is finally block and it is always executed.")


while errorHandler()==0:
    pass