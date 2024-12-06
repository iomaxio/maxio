# Input : [12, 35, 9, 56, 24]
# Output : [24, 35, 9, 56, 12]
#Here we are going to take the user input
l=[]
for i in range (5):
    n=int(input("Enter the elements:"))
    l.append(n)
print("Before Reverse 1st & last element", l)
size=len(l)
temp=l[0]
l[0]=l[size-1]
l[size-1]=temp
print("After Reverse 1st & last element", l)

