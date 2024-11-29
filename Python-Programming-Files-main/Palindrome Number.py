n=int(input("Please enter the number: "))
temp=n
c=0
while n>0:
    s=n%10
    n=n//10
    c=c*10+s
if c == temp:
    print("The Number is Palindrome")
else:
    print("The Number is not Palindrome")