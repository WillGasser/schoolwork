'''
COMP 3270 Intro to Algorithms Homework 1: Introduction to Python
install python (google it) and make sure you have python version 3.6+ 
'''
import random
import time
import matplotlib.pyplot as plt

'''
Problem 1: Implement your favorite n^2 sorting method
'''

def swap(i1, i2, A: list):
    temp = A[i1]
    A[i1] = A[i2]
    A[i2] = temp
    return A

def selectionSort(A: list):
    i = 0
    while i < len(A):
        mindex = i
        for i2 in range(i + 1, len(A)):
            if A[i2] < A[mindex]:
                mindex = i2
        A = swap(i, mindex, A)
        i += 1
    return A

'''
Problem 2: Implement merge sort
'''

def mergeS(A: list):
    if len(A) <= 1:
        return
    
    mid = len(A) // 2
    L = A[:mid]
    R = A[mid:]
    
    mergeS(L)
    mergeS(R)
    
    l, r, a = 0, 0, 0
    while l < len(L) or r < len(R):
        if l == len(L):
            A[a] = R[r]
            r += 1
        elif r == len(R):
            A[a] = L[l]
            l += 1
        elif L[l] <= R[r]:
            A[a] = L[l]
            l += 1
        else:
            A[a] = R[r]
            r += 1
        a += 1

'''
Problem 3: Implement quick sort 2 ways. 1 using a random element as the pivot. 2nd using the median of 3 random elements as the pivot
'''
import random

def quickSrand(A: list):
    if len(A) <= 1:
        return A

    pivot = random.randint(0, len(A) - 1)
    pivot_val = A[pivot]
    A[0], A[pivot] = A[pivot], A[0]

    low, high = 1, len(A) - 1
    while low <= high:
        while low < len(A) and A[low] <= pivot_val:
            low += 1
        while A[high] > pivot_val:
            high -= 1
        if high > low:
            A[low], A[high] = A[high], A[low]

    A[0], A[high] = A[high], A[0]

    left = quickSrand(A[:high])  
    right = quickSrand(A[high + 1:]) 

    return left + [A[high]] + right



def quickSmed(A: list):
    if len(A) <= 1:
        return A
    
    if len(A) >= 3:
        rs = random.sample(range(len(A)), 3)
        a, b, c = A[rs[0]], A[rs[1]], A[rs[2]]
        
        if a > b:
            a, b = b, a
        if a > c:
            a, c = c, a
        if b > c:
            b, c = c, b
        
        median = b
        pivot = A.index(median)
    else:
        pivot = random.randint(0, len(A) - 1)

    A[0], A[pivot] = A[pivot], A[0]

    pivot_val = A[0]
    low, high = 1, len(A) - 1

    while low <= high:
        while low < len(A) and A[low] <= pivot_val:
            low += 1
        while A[high] > pivot_val:
            high -= 1
        if high > low:
            A[low], A[high] = A[high], A[low]

    A[0], A[high] = A[high], A[0]

    left = quickSmed(A[:high])  
    right = quickSmed(A[high + 1:]) 

    return left + [A[high]] + right
    
'''
Problem 4: Compare the runtime between merge sort, quick sort with random pivot, and quick sort with median of 3 random elements on lists ranging from 100k to 2m by increments of 100k 
use the time package to get the time, so use start = time.time() then after the algorithm runs end = time.time()
make a graph of this. I recommend the ggplot python port plotnine, but matplotlib would be fine as well
for inputs sizes 10000 to 300000 by 20k increments also run your n^2 method and plot vs the other methods
'''

def time_sorting_algorithms():
    n2 = range(1000, 20000, 4000)
    nlogn = range(100000, 2000000, 500000)

    n2times = {'Selection Sort': []}
    nlogntimes = {
        'Merge Sort': [],
        'Quick Sort (Random Pivot)': [],
        'Quick Sort (Median of 3)': []
    }

    for size in n2:
        A = random.sample(range(size * 10), size)
        start = time.time()
        selectionSort(A)
        end = time.time()
        n2times['Selection Sort'].append((size, end - start))

    for size in nlogn:
        A = random.sample(range(size * 10), size)

        start = time.time()
        mergeS(A)
        end = time.time()
        nlogntimes['Merge Sort'].append((size, end - start))

        start = time.time()
        quickSrand(A)
        end = time.time()
        nlogntimes['Quick Sort (Random Pivot)'].append((size, end - start))

        start = time.time()
        quickSmed(A)
        end = time.time()
        nlogntimes['Quick Sort (Median of 3)'].append((size, end - start))

    return n2times, nlogntimes

def plotn2(times):
    plt.figure(figsize=(8, 5))

    sizes, times_values = zip(*times['Selection Sort'])
    plt.plot(sizes, times_values, label='Selection Sort (N^2)', marker='o')

    plt.xlabel('Input Size')
    plt.ylabel('Time (seconds)')
    plt.title('Runtime of N^2 Algorithm')
    plt.legend()
    plt.grid(True)
    plt.show()

def plotnlogn(times):
    plt.figure(figsize=(10, 6))

    for method in times:
        sizes, times_values = zip(*times[method])
        plt.plot(sizes, times_values, label=method, marker='o')

    plt.xlabel('Input Size')
    plt.ylabel('Time (seconds)')
    plt.title('Runtime Comparison of N log N Algorithms')
    plt.legend()
    plt.grid(True)
    plt.show()




'''Main Driver''' 
n2times, nlogntimes = time_sorting_algorithms()
plotn2(n2times)
plotnlogn(nlogntimes)