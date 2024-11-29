S="GeekForGeeks"
print("Printing String in upper", S.upper())
print("Printing String in lower", S.lower())
print("Printing String in title", S.title())

print("Printing the length of the String",len(S))

print("G is exist in String ? --> ",S.find("G"))
print("A is exist in String ? --> ",S.find("A"))

A="PRO12996CCU"
print("Is the string A is contain all Alphabet ? : ", A.isalpha())
B="Machine"
print("Is the String B is contain all Alphabet ? : ", B.isalpha())

print("Is the String A is Alpha-numeric ? : ", A.isalnum())
print("Is the String B is Alpha-numeric ? : ", B.isalnum())

str="123,50,50,06"
ip=str.replace(",",":")     #here , is replace with :
print(ip)

str1="Giiks for Giiks"
new_str1=str1.replace("i","e")
print(new_str1)                 # Geeks for Geeks