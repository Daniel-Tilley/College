final = 0
first = 1
next = 2
temp = 0

while temp < 4000000:

	temp = first + next

	if temp%2 == 0:
		print first
		final = final + temp

	first = next
	next = temp

print final
