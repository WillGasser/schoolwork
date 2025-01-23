'''
COMP 3270 Intro to Algorithms Homework 1: Introduction to Python
install python (google it) and make sure you have python version 3.6+ 
'''
import random
import time

'''
Problem 1: Make your own hashmap class from scratch (using only python lists). dicts not allowed. This problem will be 75% of this homework
Implement chaining in case of collisions. 
Use any hash function you like (such as those in the lecture notes). 
The underlying list may be fixed length. You do not have to account for the need to double its size when it is near capacity. Set it to 1024
Allow for types int and str (to convert an arbitrary str to a number you can use number = int.from_bytes(mystring.encode('utf-8'), 'little') and to recover the str you can use recoveredstring = number.to_bytes((number.bit_length() + 7) // 8, 'little').decode('utf-8').
For each key, there should be an associated value.
Implement insert(self, key, value), delete(self, key), get(self, key), and iter(self) which only loops through non-empty key, value pairs.
See https://www.w3schools.com/python/python_iterators.asp for how to implement an iterator in python
'''

class Node:
    def __init__(self, key, value):
        self.key = key
        self.value = value
        self.next = None
    
# I used nodes/linked list for chaining
# The lecture notes just said any data structure that can store multiple items
# This increases our OP time to O(n) with collisions
# ¯\_(ツ)_/¯
class hshMp:
    def __init__(self):
        self.arrayStorage = [None] * 1024 
    
    def hshGen(self, key):
        a = 3
        b = 2 
        p = 1021
        m = 1024 

        if isinstance(key, str):
            key = int.from_bytes(key.encode('utf-8'), 'little')
        
        return ((a * key + b) % p) % m
    
    def insert(self, key, value):
        index = self.hshGen(key)
        node = Node(key, value)
        
        if not self.arrayStorage[index]:
            self.arrayStorage[index] = node
            return

        headPtr = self.arrayStorage[index]
        while True:
            if headPtr.key == key: 
                headPtr.value = value
                return
            if headPtr.next is None:
                headPtr.next = node  
                return
            headPtr = headPtr.next
              
    def delete(self, key):
        index = self.hshGen(key)
        headPtr = self.arrayStorage[index]
        previous = None

        while headPtr is not None:
            if headPtr.key == key:
                if previous is None:
                    self.arrayStorage[index] = headPtr.next
                else:
                    previous.next = headPtr.next
                return True 
            previous = headPtr 
            headPtr = headPtr.next
        
        return False 
       
    def get(self, key):
        index = self.hshGen(key)
        headPtr = self.arrayStorage[index]

        while headPtr is not None:
            if headPtr.key == key:
                return headPtr.value 
            headPtr = headPtr.next  
        
        return None  
            
    def iter(self): 
        for keyHolder in self.arrayStorage:
            headPtr = keyHolder
            while headPtr is not None:
                yield (headPtr.key, headPtr.value)
                headPtr = headPtr.next
                
'''
Problem 2: Use your hashmap class to count the number of each substring of length k in a DNA sequence. 
Print out the repeated items and the number of times they were repeated
run it on string "ATCTTGGTTATTGCGTGGTTATTCTTGC" with k=4
'''

def problem2(s, k):
    mapDNA = hshMp()
    for i in range(len(s) - k + 1):
        key = s[i:i+k]
        currVal = mapDNA.get(key)
        if currVal is None:
            mapDNA.insert(key, 1)
        else:
            mapDNA.insert(key, currVal + 1)
        
    for keyHolder in mapDNA.iter():
        if keyHolder[1] > 1: 
            print(f"{keyHolder[0]}: {keyHolder[1]}")
    
#############################################################    
    
problem2("ATCTTGGTTATTGCGTGGTTATTCTTGC", 4)

'''
Problem 3: Two sum. This time just use the python dict or set. 
Given an array, find two numbers that sum to a target number (don't worry about not reusing the same index this time). 
Code this two ways. Once brute force with nested for loops. And once using hashing. 
Use the input below. Bonus to code the sorting/binary search method. Feel free to use sort() or sorted() but code binary search yourself.
Compare the time taken between the implementations using the time package imported above.
'''

A = [random.randint(0,1000000000) for i in range(10000)]
target = A[random.randint(0, len(A)-1)] + A[random.randint(0,len(A)-1)]

# Method One (Brute Force)
def bruteSum(A, targ):
    for i in range(len(A)):
        for i2 in range(len(A)):
            if i == i2: continue
            if A[i] + A[i2] == targ: return [i, i2]
    return None

# Method Two (Hashing) 
def hashSum(A, targ):
    values = {}
    for i in range(len(A)):
        values[A[i]] = i

    for i in range(len(A)):
        comp = targ - A[i]
        if comp in values and values[comp] != i:
            return [i, values[comp]]  
    return None
               
# Method Three (Sort / Binary Search)

def binSearchSum(A, target):
    A = sorted(A)
    for i, elem in enumerate(A):
        left = 0
        right = len(A) - 1
        while left <= right:
            mid = left + (right - left) // 2
            sum = elem + A[mid]
            if sum == target and i != mid:
                return [i, mid]
            elif sum < target:
                left = mid + 1
            else:
                right = mid - 1
    return None

    
#####################################################

def twoSumRunner(method, A, target):
    t1 = time.time()
    answer = method(A, target)
    t2 = time.time()
    print(f'Answer: {answer}') 
    return t2 - t1

timer = twoSumRunner(bruteSum, A, target)
print(f'It took: {timer} seconds for bruteSum')

timer = twoSumRunner(hashSum, A, target)
print(f'It took: {timer} seconds for hashSum')

timer = twoSumRunner(binSearchSum, A, target) # It shows the sorted array indicies; I did not trace back to the original array
print(f'It took: {timer} seconds for binSearchSum')