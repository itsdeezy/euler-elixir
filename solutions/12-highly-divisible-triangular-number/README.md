# Problem

The sequence of triangle numbers is generated by adding the natural numbers. So 
the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The first ten 
terms would be:

1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

Let us list the factors of the first seven triangle numbers:

 1: 1  
 3: 1,3  
 6: 1,2,3,6  
10: 1,2,5,10  
15: 1,3,5,15  
21: 1,3,7,21  
28: 1,2,4,7,14,28  
We can see that 28 is the first triangle number to have over five divisors.

What is the value of the first triangle number to have over five hundred 
divisors?

## Initial thoughts
Brute force is to generate triangle numbers, factorize and until we have the
desired amount of factors. This process would essentially be O(n<sup>2</sup>).

Alternatively, I believe we can also use our prime factorization method from 
problem 5, which has run time of O(log n). After we have our prime factors, we 
can construct the factors by choosing a number of prime factors. The 2nd part
of the algorithm would be logarithmic as well using recursion. The hope is that 
m (number of prime factors) << n (the actual number).
