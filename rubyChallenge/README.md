## Ruby Challenges
#### Project Caesar Cipher
Implement a caesar cipher that takes in a string and the shift factor and then outputs the modified string
Wikepida: [Caesar Cipher](http://en.wikipedia.org/wiki/Caesar_cipher)
Wikepida: [rot13](http://en.wikipedia.org/wiki/ROT13) , rotate by 13 is an example of a caesar cipher.

####Project Stock Picker
Implement a method `#stock_picker` that takes in an array of stock prices, one for each hypothetical day. It should return a pair of days representing the best day to buy and the best day to sell. Days start at 0.

#### Project Substrings
Implement a method `#substrings` that takes a word as the first argument and then an array of valid substrings (your dictionary) as the second argument. It should return a hash listing each substring (case insensitive) that was found in the original string and how many times it was found.

#### Project Bubble Sort
May be run with `ruby bubble_sort.rb`

* `#bubble_sort` sorts an array using the bubble sort method.
* `#bubble_sort_by` sorts an array using the bubble sort method, but expects a block which it uses to compare two elements of the array. The block's return should be similar to the spaceship operator (`<=>`).

#### Project Enumarable
* Extend Ruby's Enumerable module to include `#my_each`, `#my_each_with_index`, `#my_select`, `#my_all?`, `#my_any?`, `#my_none?`, `#my_count`, `#my_map`, and `#my_inject`.
* Each of these methods perform similarly to the corresponding Enumerable method (e.g `#my_each` is similar to `#each`).

#### Project Euler
My solutions to problem sets posted at [Project Euler](https://projecteuler.net/).

#### Tic Tac Toe Project
Simple Command line Tic Tac Toe built from Ruby
Sample Output:
```
------------------------------
Welcome to my TicTacToe Game!!
------------------------------
Foo has been selected to go first!

- | - | -
- | - | -
- | - | -

Turn: 1
foo ('x') : Enter a number from 1 and 9 to make your move. 1

x | - | -
- | - | -
- | - | -

Turn: 2
bar ('o') : Enter a number from 1 and 9 to make your move. 2

x | o | -
- | - | -
- | - | -

Turn: 3
foo ('x') : Enter a number from 1 and 9 to make your move. 3

x | o | x
- | - | -
- | - | -

Turn: 4
bar ('o') : Enter a number from 1 and 9 to make your move. 4

x | o | x
o | - | -
- | - | -

Turn: 5
foo ('x') : Enter a number from 1 and 9 to make your move. 5

x | o | x
o | x | -
- | - | -

Turn: 6
bar ('o') : Enter a number from 1 and 9 to make your move. 6

x | o | x
o | x | o
- | - | -

Turn: 7
foo ('x') : Enter a number from 1 and 9 to make your move. 7
CONGRATS foo, YOU WON!

x | o | x
o | x | o
x | - | -

---------
Game Over
---------
```

