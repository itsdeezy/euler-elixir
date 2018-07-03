# Problem
If we list all the nautral numbers below 10 that are multples of 3 or 5, we get 
3, 5, 6, 9. The sum of these multiples is 23. Find the sum of all the multipes 
of 3 or 5 below 1000.

## Initial Thoughts
We could use an inplace solution where we keep a rolling sum that gets
increased if the number is a multiple of 3 or 5. The number in our case
would just be the index of the array.

**Time Complexity** O(n)
**Space Complexity** O(1)