#Python 3
#inputString = input("Please enter a string: ")

#Python 2
inputString = raw_input("Please enter a string: ")

def testString (test):
  #reverse string using index
  revString = test[::-1]

  if revString == test:
    print "True"

  else:
    print "False"

testString (inputString)