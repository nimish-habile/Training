print("""                                                                                                  
                      .-.       .-.                                      ___                                                      
                    /    \    /    \                                   (   )                                                     
  .--.      .--.    | .`. ;   | .`. ;    .--.     .--.         .--.     | | .-.     .--.      .-..      .-..     .--.     .--.   
 /    \    /    \   | |(___)  | |(___)  /    \   /    \      /  _  \    | |/   \   /    \    /    \    /    \   /    \   /    \  
|  .-. ;  |  .-. ;  | |_      | |_     |  .-. ; |  .-. ;    . .' `. ;   |  .-. .  |  .-. ;  ' .-,  ;  ' .-,  ; |  .-. ; |  .-. ; 
|  |(___) | |  | | (   __)   (   __)   |  | | | |  | | |    | '   | |   | |  | |  | |  | |  | |  . |  | |  . | |  | | | |  | | | 
|  |      | |  | |  | |       | |      |  |/  | |  |/  |    _\_`.(___)  | |  | |  | |  | |  | |  | |  | |  | | |  |/  | |  |/  | 
|  | ___  | |  | |  | |       | |      |  ' _.' |  ' _.'   (   ). '.    | |  | |  | |  | |  | |  | |  | |  | | |  ' _.' |  ' _.' 
|  '(   ) | '  | |  | |       | |      |  .'.-. |  .'.-.    | |  `\ |   | |  | |  | '  | |  | |  ' |  | |  ' | |  .'.-. |  .'.-. 
'  `-' |  '  `-' /  | |       | |      '  `-' / '  `-' /    ; '._,' '   | |  | |  '  `-' /  | `-'  '  | `-'  ' '  `-' / '  `-' / 
 `.__,'    `.__.'  (___)     (___)      `.__.'   `.__.'      '.___.'   (___)(___)  `.__.'   | \__.'   | \__.'   `.__.'   `.__.'  
                                                                                            | |       | |                        
                                                                                           (___)     (___)                       
                
""")

print("Hello!! Welcome to the coffee shop.")

print("|              |", "      Milk     |", "           Coffee    |", "       Water   |", "      Price   |")
print("-"*90)
print("|Americano:    |", "       1       |", "              3      |", "         0     |", "       80     |")
print("|Cappuccino:   |", "       1       |", "              2      |", "         1     |", "       100    |")
print("|Latte:        |", "       1       |", "              1      |", "         2     |", "       150    |")

Balance = 900
Coffee = 10
Water = 20
Milk = 10

# Americano
# Cappuccino
# Latte


coffeeDetails = [0, [1, 3, 0] ,[1, 2, 1] ,[1, 1, 2]]

Cost =[0, 80, 100, 150]

while True:
    try:
        print(f"Your current balance is {Balance}Rs.")
        print(f"Items available: Coffee {Coffee}, Water {Water} and Milk {Milk}")
        print("Enter 1 to order an Americano.")
        print("Enter 2 to order an Cappuccino.")
        print("Enter 3 to order an Latte.")
        coffeType = int(input("Enter here: "))
        if coffeType>3 or coffeType<=0:
            print("Please enter a number from 1 to 3.")
        elif Coffee<coffeeDetails[coffeType][0] or Water<coffeeDetails[coffeType][1] or Milk<coffeeDetails[coffeType][2] or Balance<Cost[coffeType]:
            if Coffee<coffeeDetails[coffeType][0]:
                print("Insufficient Coffee.")
            if Water<coffeeDetails[coffeType][1]:
                print("Insufficient Water.")
            if Milk<coffeeDetails[coffeType][2]:
                print("Insufficient Milk.")
            if Balance<Cost[coffeType]:
                print("Insufficient Balance")
        else:
            Balance-=Cost[coffeType]
            Coffee-=coffeeDetails[coffeType][0]
            Water-=coffeeDetails[coffeType][1]
            Milk-=coffeeDetails[coffeType][2]
            if coffeType==1:
                print("Your Americano is served.")
            elif coffeType==2:
                print("Your Cappiccino is served.")
            else:
                print("Your Latte is served.")
            print("To order again enter anything, to exit enter 0.")
            checkNextOrder = input("Enter here : ")
            if checkNextOrder=="0":
                print(f"Your balance left now is {Balance}Rs.")
                break
    except ValueError :
        print("Please enter a valid input")
    except:
        print("Some unknown error.")