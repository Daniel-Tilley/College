index = 1 #Index of term
first = 1 #First number is sequece
next = 1 #Next number in sequence
temp = 0 #Temp value for swapping data

#Run loop until we find a number with 1000 digits
while len(str(first)) != 1000:

  #swap values
  temp = first + next
  first = next
  next = temp

  #Increment counter
  index = index + 1

  #Print value
print (index)
