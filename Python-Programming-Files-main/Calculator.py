def cal(var1, var2, option):
    if option == 1:
        return var1+var2
    elif option == 2:
        return var1-var2
    elif option == 3:
        return var1*var2
    elif option == 4:
        if var1>var2:
            return var1/var2
        else:
            return "Infinite !!"
    else:
        return "Please check the below options !!"

o = int(input("""
Please Enter below options for calculator :
    1 for Addition
    2 for Substarction
    3 for Multiplication
    4 for Division
"""))
x = int(input("Please enter your first value:"))
y = int(input("Please enter your second value:"))

sum=cal(x,y,o)
print(sum)
