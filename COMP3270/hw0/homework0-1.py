'''
COMP 3270 Intro to Algorithms Homework 0: Introduction to Python
install python (google it) and make sure you have python version 3.6+ 
'''

import numpy as np

# this is a single line comment just so you know

'''
This is a multi
line comment just fyi
'''

#Problem 1: print the string hello world to standard out
print('hello world')


'''
Problem 2: declare variables with the types int, float, boolean, Nonetype and print their values and types
then perform operations additions, subtraction, multiplication, division, and power on the float and integer division and modulo on the int
'''
intVar = 55
floatVar = float(55)
boolVar = False
noneVar = None

print(intVar, floatVar, boolVar, noneVar)

floatVar = floatVar + 5 - 10 * 3 / 5 ** 2
intVar = intVar // 2 
moduloRem = intVar % 3

'''
Problem 3: declare two strings and concatenate them
then print out the 2nd character to the last character without knowing the length of the string. 
'''

str1 = 'testONE'
str2 = 'testTWO'

str3 = str1 + str2

print(str3[len(str3) - 2])


#Problem 4: Write a function that takes in a string name and prints out Hello, <name>!

def greeting(name: str):
    print('Hello, ' + name + '!')


'''
Problem 5: Write a function that takes in a number x and you compute and print out x! 
'''
def xFactorial(x: int):
    if x < 0:
        raise ValueError('x must be a non-negative integer')
    product = 1
    while(x > 1):
        product *= x
        x -= 1
    return product

'''
Problem 6: Write if statements to check if a number is postive, negative, or 0 and print a statement to that effect
'''
def checker(num):
    if num == 0: print('Your number is 0')
    if num > 0: print('Your number is positive')
    else: print('Your number is negative')


'''
Problem 7: Write a function that takes in a number x and prints out x^2
'''

def square(x):
    print(x * x)

'''
Problem 8: Make a list of the squares of the numbers 0 to 9
add 100 to the end of that list
create another list with the square of the values 11 to 15 and concatenate those lists (show me 2 ways to do this)
check if the number 25 is in that list and print if it is
do the same with a list-comprehension to generate the list
create a dictionary where the keys are the numbers 0 to 9 and the values are the square of those numbers
create a set of the unique characters in a string
'''
squares1 = [i ** 2 for i in range(10)]
squares1.append(100)
squares2 = [i ** 2 for i in range(11, 16)]

# Method one
concatList = squares1 + squares2

# Method two
squares1.extend(squares2)
concatList = squares1



if 25 in concatList:
    print("25 is in the list")


squareDict = {i: i ** 2 for i in range(10)}

unique = set("test string to use")






'''
Problem 9: FizzBuzz
Write a function that takes in a list of numbers, loops over it and prints out Fizz if the number is a multiple
of 3, Buzz if it is multiple of 5, and FizzBuzz if it is a multiple of 3 and 5, otherwise print out the number
'''

def FizzBuzz(nums: list):
    for num in nums:
        if num % 3 == 0 and num % 5 == 0:
            print('FizzBuzz')
            continue
        if num % 3 == 0:
            print('Fizz')
            continue
        if num % 5 == 0:
            print('Buzz')
            continue
        print(num)
            
        


'''
Problem 10: Make a class called Person with attributes age and name
Make a method for that class called introduce which prints out an introduction with its name and age
Make an instance of that class and call its introduce method
'''
class Person:
    def __init__(self, age: int, name: str):
        self.age = age
        self.name = name
        
    def introduce(self):
        print('Hi, my name is ' + self.name + ' and I am ' + str(self.age) + ' years old!')
        
person1 = Person(25, 'Mike')
person1.introduce()
        
    


'''
Problem 11: install numpy, import it here and get the mean of a list of numbers and print it out
'''

mean = np.mean(concatList)
print ('Mean: '+ str(mean))