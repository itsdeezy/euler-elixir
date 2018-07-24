# Problem
If the numbers 1 to 5 are written out in words: one, two, three, four, five, 
then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

If all the numbers from 1 to 1000 (one thousand) inclusive were written out in 
words, how many letters would be used?

NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and 
forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 
letters. The use of "and" when writing out numbers is in compliance with British 
usage.

## Initial Thoughts
This is asking for a translation module, where each number can be translated
into its english string form. We will translate numbers under 10_000 with some
rules.

1 -> one
...
11 -> eleven
12 -> twelve
13 -> thir-teen
14 -> four-teen
15 -> fif-teen
16 -> six-teen
17 -> seven-teen
18 -> eigh-teen
19 -> nine-teen
20 -> twenty
21 -> twenty one
...
30 -> thir-ty
...
40 -> for-ty
...
50 -> fif-ty
...
99 -> ninety nine
100 -> one hundred
101 -> one hundred and one
111 -> one hundred and eleven
121 -> one hundred and twenty one

