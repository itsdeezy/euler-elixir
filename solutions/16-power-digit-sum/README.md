# Problem
2<sup>15</sup> = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

What is the sum of the digits of the number 2<sup>1000</sup>?

## Inital Thoughts
Obviously, 2<sup>1000</sup> represents a number too big to calculate. However, 
we can mimic multiplication with a list. Each element in the list would 
represent a single digit. The first element in the list would be the one's 
digit and the last being the nth digit. We can then loop through, doubling the 
virtual number every iteration, and performing the carry forward ourselves.

This seems slow, as we have to iterate through the array at each outer 
iteration.
