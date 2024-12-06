# Input : [12, 35, 9, 56, 24]
# Output : [24, 35, 9, 56, 12]

l=[12,45,63,58,24]
temp=l[0]
l[0]=l[-1]
l[-1]=temp
print("The new list is :", l)