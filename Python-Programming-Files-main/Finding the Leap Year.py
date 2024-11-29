y=int(input("Please enter the year: "))
if(y%4==0 and y/100!=0 or y%400==0):
    print("The year is Leap Year ,",y)
else:
    print("The Year is not leap year, ",y)

