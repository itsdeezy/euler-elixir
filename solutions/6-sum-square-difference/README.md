# Problem
The sum of the squares of the first ten natural numbers is,  
1^2 + 2^2 + ... 10^2 = 385

The square of the sum of the first ten natural numbers is,  
(1 + 2 + ... + 10)^2 = 55^2 = 3025

Hence the difference between the sum of the squares of the first ten natural 
numbers and the square of the sum is 3025 - 385 = 2640

Find the difference between the sum of the squares of the first one hundred 
natural numbers and the square of the sum.

## Initial thoughts
This is pretty straight foward to just compute, and the numbers, at initial 
estimation should not be over the small integer limit on 64 bit machines (in 
erlang, a small integer is 60 bits, or -576460752303423489 < i < 
576460752303423488)

However, we can make the code reuseable by composing idiomatic functions .
