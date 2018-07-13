# Problem
A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

a<sup>2</sup> + b<sup>2</sup> = c<sup>2</sup>  
For example, 3<sup>2</sup> + 4<sup>2</sup> = 9 + 16 = 25 = 52.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.

## Initial thoughts
This algorithm should find all the pythagorean triples of any integer. The brute
force approach is to fix one number that is less than n, let that be c. Then 
fix another number that is less than n - c<sup>2</sup>, let that be b. Then fix 
another number that is less than n - c<sup>2</sup> - b<sup>2</sup>.

This solution would take quite a bit of time. Instead, we can solve the 
equations to some extent. We know:

a<sup>2</sup> + b<sup>2</sup> = c<sup>2</sup>  
a + b + c = n

We can reduce an unknown in terms of n, lets choose c.

let: c = n - a - b  
a<sup>2</sup> + b<sup>2</sup> = (n - a - b)<sup>2</sup>  
Eqn: (a<sup>2</sup> + b<sup>2</sup>)<sup>0.5</sup> + a + b = n

Now, the algorithm must find all pairs of a & b that satisfies the equation
above. 

We can even go one step further, and solve the quadratic function. However this
solution should be sufficient for this problem.

