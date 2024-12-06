n=int(input("Please enter the number: "))
temp=n
s=0
while(n>0):
    r=n%10
    fact=1
    for i in range (1,r+1):
        fact = fact *i
    n=n//10
    s=s+fact
if (s==temp):
    print("The number is Strong Number: ", temp)
else:
    print("The number is not a Strong Number: ", temp)