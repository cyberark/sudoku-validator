# Sudoku Validator

The Sudoku Validator library provides a mechanism for validating a Sudoku solution.

## Valid Solutions
A valid Sudoku solution is one in which the number one through nine appears only once in each vertical row, horizontal row, and square.

## Input
The `SudokuValidator` class takes a multi-line string with a solved solution:

A valid solution:
```
4 3 5 | 2 6 9 | 7 8 1
6 8 2 | 5 7 1 | 4 9 3
1 9 7 | 8 3 4 | 5 6 2
------+------+------
8 2 6 | 1 9 5 | 3 4 7
3 7 4 | 6 8 2 | 9 1 5
9 5 1 | 7 4 3 | 6 2 8
------+------+------
5 1 9 | 3 2 6 | 8 7 4
2 4 8 | 9 5 7 | 1 3 6
7 6 3 | 4 1 8 | 2 5 9
```

An invalid solution (the number `3` appears multiple times in the horizontal, vertical, and square):
```
3 3 5 | 2 6 9 | 7 8 1
3 8 2 | 5 7 1 | 4 9 3
1 9 7 | 8 3 4 | 5 6 2
------+------+------
8 2 6 | 1 9 5 | 3 4 7
3 7 4 | 6 8 2 | 9 1 5
9 5 1 | 7 4 3 | 6 2 8
------+------+------
5 1 9 | 3 2 6 | 8 7 4
2 4 8 | 9 5 7 | 1 3 6
7 6 3 | 4 1 8 | 2 5 9
```

## Development
The SudokuValidator library is written in Ruby. The only development requirement is having Ruby 2.0 or greater available on your system.


### Testing
Tests for the SudokuValidator are written using MiniTest, using the Spec style. Tests can run with:
```
$ ruby sudoku_validator_spec.rb
```
