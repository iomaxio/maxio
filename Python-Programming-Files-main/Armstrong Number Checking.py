n=int(input("Please enter the number: "))
temp=n
sum=0
while n>0:
    r=n%10
    n=n//10
    sum=sum+pow(r,3)
if(temp==sum):
    print("The number is Armstrong number: ",temp)
else:
    print("The number is not a Armstrong Number: ",temp)
