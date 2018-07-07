# Problem
2520 is the smallest number that can be divided by each of the numbers from 1 
to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the 
numbers from 1 to 20?

## Initial Thoughts
Increment each factor simulatenously, storing each in a list and comparing at
the end of each iteration. Worst case the solution will be the product of each
factor. 

Alternatively, we could create a graph of products, then transform that graph 
into a list, and grab the smallest element in that list that is divisible by
each input. 

**Time Complexity** O(n^2)
**Space Complexity** O(n^2)

## Solution
The efficient solution is to find the prime factors of each number, then 
multiply those prime factors together the number of times equal to the
greatest occurrence in each number. 

Let's store each prime factor with their number of occurences in a keyword list.
We'll use a separate function to recursively find the prime factorization.