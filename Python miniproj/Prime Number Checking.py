n=int(input("Please enter the number: "))
flag=0
for i in range(2,n):
    if(n%i==0):
        flag=1
        break
if(flag==0):
    print("The number is Prime Number",n)
else:
    print("The number is not a Prime Number", n)



