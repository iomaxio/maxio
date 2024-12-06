print("Please enter year in YYYY format")
start = int(input("Please enter lower year range:"))
end = int(input("Please enter higher year range: "))
leap = []

if start<end:
    for y in range(start, end+1):
        if y%4==0 and y/100 !=0:
            print(y)
            leap.append(y)
    print(leap)
else:
    print("Strat year should be small with respect to end year!!")


