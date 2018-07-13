# Problem
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that 
the 6th prime is 13.

What is the 10 001st prime number?

## Initial thoughts
The problem is essentially asking us to iterate primes. A quick solution would
be to have a number of primes persisted (in-memory or disk). We could then just
access the 10001st prime in O(1) time.

If the count of prime is greater than what we have persisted, we would then 
have to discover a new prime. The brute force prime check for a number would be
to divide the range 2..n-1 into the prime, and ensure that no remainder exists
for each prime.

To implement this algorithm from the beginning, we need a loop of n size (where
n is the place of the prime to find, in this case 10001st). The loop's increment
condition is that a new prime is found, which, using our previous algorithm, is
going to run in the range 2..m-1, where m is the current number. This is really
slow, and to find any prime again, say 9999th prime, we'd have to start again.

For the purposes of this problem, we're going to ignore the problem described in
paragraph above. Persistance is a good enough solution. Instead, we'll just 
the problem using the brute force method. Given that a speedier approach is
required, a new primality test could be built.

## This solution is very slow, and could use an upgrade