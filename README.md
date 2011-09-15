Practice Problems
=================
This is a collection of algorithm and data structure practice problems along
with my solutions. Language does not matter. Some will probably be in Ruby, 
while others may be in Java or Python for variety.

almost-twins
------------
Given a binary search tree and a value X, find the node with value immediately
greater than X.

fibonacci
---------
Given N, print the first N Fibonacci numbers. For example, `fib_sequence(6)` should
return

    0 1 1 2 3 5

more-than-perms
---------------
Given a set of letters and a length N, produce all possible output. (Not permutation).
For example, give the letter `(p,o)` and length of `3`, produce the following
output(in any order you want, not just my example order):

    ppp ppo poo pop opp opo oop ooo

Another example would be given `(a,b)` and length `2`:

    ab aa bb ba

pivot
-----
Given an array of unsorted integers, find the pivot point `n` in the array where
the sum of `input(0..n)` = sum of `input(n+1..input.size)`. Values in the input
array may be positive or negative.

For example, given the input:

    [1,2,3,0,4,2]

The pivot point would be `3`, the index of element with the value `0` because:

    input[0] + input[1] + input[2] = input[4] + input [5]
       1     +    2     +    3     =    4     +    2

secret-santa
------------
Given an array of names, generate a hash that can be used for the 'secret santa'
game. For example, given the array:

    ['thom', 'sally', 'doug', 'steve']

Some valid solutions may include:

    {"thom"=>"sally", "sally"=>"steve", "steve"=>"doug", "doug"=>"thom"}
    {"steve"=>"sally", "sally"=>"thom", "thom"=>"doug", "doug"=>"steve"}

spiral-matrix
-------------
Print a 2D int matrix in sprial order. For example, given the array:

    [[1,2,3],
     [4,5,6],
     [7,8,9]]

Return the solution:

    [1,2,3,6,9,8,7,4,5]

sum-of-evil
-----------
Given a number, come up with all of the possible ways to insert `+` and `-` in
that number. For example, given `123`, possible output would be:

    1+23 
    1+2+3
    1-23
    1-2+3
    1-2-3
    1+2-3
    12+3
    12-3
