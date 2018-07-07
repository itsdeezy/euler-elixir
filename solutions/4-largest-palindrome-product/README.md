# Problem
A palindromic number reads the same both ways. The largest palindrome made from 
the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.

## Initial Thoughts
Iterate through all product combinations of 3 digits, keep a rolling sum of 
largest pallindrome. This algorithm seems extremely inefficient.

We also know the upper and lower bound of this calulation, one is 10_000 
(100x100), the other is 998_001 (999x999). Using that we could iterate backwards
and find the first pallindrome number with two factors between [100, 999]. This
solution seems inefficient as the algorithm would also require a factorization
of every product, which could be expensive (not sure).

Maybe we can break down the mathematics behind multiplication. Since we know 
that the factors have to be 3 digits, we know that it can be broken down to be
3 multiplication steps.

let the first 3 digit number be x
let the 2nd 3 digit number be y
let the digit composition of y be a, b, c respectively (111 can be composed of 
100 + 10 + 1)

the solution could then be represented as `x * a + x * b + x * c`, or 
`x * a' * 100 + x * b' * 10 + x * c'` if we factor out the coefficients.

## Palindrome check
The palindrome check could be done by converting the integer into a base 10 
array, then doing a symmetry check on the array.

**Time Complexity** O(n/2)
**Space Complexity** O(n)

