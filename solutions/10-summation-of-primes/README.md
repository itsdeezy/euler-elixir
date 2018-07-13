# Problem
The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below two million.

## Initial thoughts
Brute force it, maintain a list of primes as we travel through the list. Sum 
them up after.

The brute force solution would take far too long. The correct implementation 
would be to use the Sieve of Eratosthenes. 

The third attempt on a faster Sieve takes advantage of the fact that when we 
reject candidates, if only 1 is rejected at a time, we can assume the rest of
the numbers are primes (reaching the ceiling).