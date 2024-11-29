l = int(input("Please enter a Lower Limit:"))
u = int(input("Please enter a End Limit:"))
prime=[]
for n in range(l,u+1):
    flag=0
    if n>1:
        for i in range(2,n):
            
            if n%i==0:
                flag=1
            break
        if flag==0:
            print(n,"This is the Prime Number")
            prime.append(n)
        else:
            print(n,"This is not a Prime Number")
print(prime)




