# Problem
The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?

## Initial Thoughts
The brute force solution requires us to iterate from 1..n, keeping track of 
the largest number that is both prime and a factor of n.

**Time Complexity** O(n)
**Space Complexity** O(1)

## Second attempt
We can iterate from 2..n/2, and figure out the complimentary factor of the 
iterator. The first compliment that is a prime number would be the solution. 
This solution also requires an implementation of a prime test.

**Time Complexity** worst case: O(n), best case: O(1)
**Space Complexity** O(1)