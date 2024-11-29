l=["Hello", 10,20,30,45,45,20,11,10,58,95,85,11]

d=[]
for i in l:
    if l.count(i)>1 and i not in d:
        d.append(i)
print("The duplicates elements are: ", d)

#Another method for finding duplicates from a list

L=["World","sky",10,20,10,40,20,45,'sky']
D=[]
for i in range (len(L)):
    for j in range (i+1, len(L)):
        if L[i]==L[j] and L[i] not in D:
            D.append(L[i])
print("The duplicates from 2nd list: ", D)