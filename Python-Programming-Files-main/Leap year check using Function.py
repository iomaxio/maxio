def leap_year(y):
    if(y%4==0 and y/100!=0 or y%400==0):
        return True
    else:
        return False

x=int(input("Please enter the Year:"))
if (leap_year(x)==True):
    print("The Year is Leap year. ",x)
else:
    print("The Year is not a Leap Year.",x)
