require 'minitest/autorun'
require './sudoku_validator'

describe SudokuValidator do
  before do
    @sudoku_validator = SudokuValidator.new
  end

  describe ".validate" do
    it "returns true when given a valid 9x9 grid" do
      valid_grid = [
        '4 3 5 | 2 6 9 | 7 8 1',
        '6 8 2 | 5 7 1 | 4 9 3',
        '1 9 7 | 8 3 4 | 5 6 2',
        '------+-------+------',
        '8 2 6 | 1 9 5 | 3 4 7',
        '3 7 4 | 6 8 2 | 9 1 5',
        '9 5 1 | 7 4 3 | 6 2 8',
        '------+-------+------',
        '5 1 9 | 3 2 6 | 8 7 4',
        '2 4 8 | 9 5 7 | 1 3 6',
        '7 6 3 | 4 1 8 | 2 5 9'
      ].join("\n")
      @sudoku_validator.valid?(valid_grid).must_equal true
    end

    it "returns false when given an invalid 9x9 grid (original test)" do
      invalid_grid = [
        '3 3 5 | 2 6 9 | 7 8 1',
        '3 8 2 | 5 7 1 | 4 9 3',
        '1 9 7 | 8 3 4 | 5 6 2',
        '------+-------+------',
        '8 2 6 | 1 9 5 | 3 4 7',
        '3 7 4 | 6 8 2 | 9 1 5',
        '9 5 1 | 7 4 3 | 6 2 8',
        '------+-------+------',
        '5 1 9 | 3 2 6 | 8 7 4',
        '2 4 8 | 9 5 7 | 1 3 6',
        '7 6 3 | 4 1 8 | 2 5 9'
      ].join("\n")
      @sudoku_validator.valid?(invalid_grid).must_equal false
    end

    it "returns false when given an invalid 9x9 grid (horizontal error)" do
      invalid_grid = [
        '4 3 5 | 2 6 9 | 7 8 1',
        '6 8 2 | 5 7 1 | 4 9 3',
        '1 9 7 | 8 3 4 | 5 6 2',
        '------+-------+------',
        '8 2 6 | 1 9 5 | 3 4 7',
        '3 7 4 | 6 8 2 | 9 1 5',
        '9 5 1 | 7 4 3 | 6 2 8',
        '------+-------+------',
        '5 1 9 | 3 2 6 | 8 7 4',
        '2 4 8 | 9 5 7 | 1 3 9',
        '7 6 3 | 4 1 8 | 2 5 6'
      ].join("\n")
      @sudoku_validator.valid?(invalid_grid).must_equal false
    end

    it "returns false when given an invalid 9x9 grid (vertical error)" do
      invalid_grid = [
        '4 3 5 | 2 6 9 | 7 8 1',
        '6 8 2 | 5 7 1 | 4 9 3',
        '1 9 7 | 8 3 4 | 5 6 2',
        '------+-------+------',
        '8 2 6 | 1 9 5 | 3 4 7',
        '3 7 4 | 6 8 2 | 9 1 5',
        '9 5 1 | 7 4 6 | 3 2 8',
        '------+-------+------',
        '5 1 9 | 3 2 6 | 8 7 4',
        '2 4 8 | 9 5 7 | 1 3 6',
        '7 6 3 | 4 1 8 | 2 5 9'
      ].join("\n")
      @sudoku_validator.valid?(invalid_grid).must_equal false
    end

    it "returns false when given an invalid 9x9 grid (box error)" do
      invalid_grid = [
        '4 3 5 | 2 6 9 | 7 8 1',
        '6 8 2 | 5 7 1 | 4 9 3',
        '1 9 7 | 8 3 4 | 5 6 2',
        '------+-------+------',
        '8 2 6 | 1 9 5 | 3 4 7',
        '3 7 4 | 6 8 2 | 9 1 5',
        '5 1 9 | 3 2 6 | 8 7 4',
        '------+-------+------',
        '9 5 1 | 7 4 3 | 6 2 8',
        '2 4 8 | 9 5 7 | 1 3 6',
        '7 6 3 | 4 1 8 | 2 5 9'
      ].join("\n")
      @sudoku_validator.valid?(invalid_grid).must_equal false
    end

    it "returns true when given a valid 4x4 grid" do
      valid_grid = [
        '1 2 | 3 4',
        '3 4 | 1 2',
        '----+----',
        '2 1 | 4 3',
        '4 3 | 2 1'
      ].join("\n")
      @sudoku_validator.valid?(valid_grid).must_equal true
    end

    it "returns false when given an invalid 4x4 grid (horizontal error)" do
      invalid_grid = [
        '1 2 | 3 4',
        '3 4 | 1 2',
        '----+----',
        '2 1 | 4 1',
        '4 3 | 2 3'
      ].join("\n")
      @sudoku_validator.valid?(invalid_grid).must_equal false
    end

    it "returns false when given an invalid 4x4 grid (vertical error)" do
      invalid_grid = [
        '1 2 | 3 4',
        '3 4 | 1 2',
        '----+----',
        '2 1 | 4 3',
        '4 3 | 1 2'
      ].join("\n")
      @sudoku_validator.valid?(invalid_grid).must_equal false
    end

    it "returns false when given an invalid 4x4 grid (box error)" do
      invalid_grid = [
        '1 2 | 3 4',
        '2 3 | 4 1',
        '----+----',
        '3 4 | 1 2',
        '4 1 | 2 3'
      ].join("\n")
      @sudoku_validator.valid?(invalid_grid).must_equal false
    end

    it "returns true when given a valid 6x6 grid" do
      valid_grid = [
        '1 2 | 3 4 | 5 6',
        '3 4 | 5 6 | 1 2',
        '5 6 | 1 2 | 3 4',
        '----+-----+----',
        '2 1 | 4 3 | 6 5',
        '4 3 | 6 5 | 2 1',
        '6 5 | 2 1 | 4 3'
      ].join("\n")
      @sudoku_validator.valid?(valid_grid).must_equal true
    end

    it "returns false when given an invalid 6x6 grid (horizontal error)" do
      invalid_grid = [
        '1 2 | 3 4 | 5 6',
        '3 4 | 5 6 | 1 2',
        '5 6 | 1 2 | 3 4',
        '----+-----+----',
        '2 1 | 4 3 | 6 5',
        '4 3 | 6 5 | 2 3',
        '6 5 | 2 1 | 4 1'
      ].join("\n")
      @sudoku_validator.valid?(invalid_grid).must_equal false
    end

    it "returns false when given an invalid 6x6 grid (vertical error)" do
      invalid_grid = [
        '1 2 | 3 4 | 5 6',
        '3 4 | 5 6 | 1 2',
        '5 6 | 1 2 | 3 4',
        '----+-----+----',
        '2 1 | 4 3 | 6 5',
        '4 3 | 6 5 | 2 1',
        '6 5 | 1 2 | 4 3'
      ].join("\n")
      @sudoku_validator.valid?(invalid_grid).must_equal false
    end

    it "returns false when given an invalid 6x6 grid (box error)" do
      invalid_grid = [
        '1 2 | 3 5 | 4 6',
        '3 4 | 5 1 | 6 2',
        '5 6 | 1 3 | 2 4',
        '----+-----+----',
        '2 1 | 4 6 | 3 5',
        '4 3 | 6 2 | 5 1',
        '6 5 | 2 4 | 1 3'
      ].join("\n")
      @sudoku_validator.valid?(invalid_grid).must_equal false
    end

    it "returns true when given a valid 8x8 grid" do
      valid_grid = [
        '1 2 3 4 | 5 6 7 8',
        '5 6 7 8 | 1 2 3 4',
        '--------+--------',
        '2 3 4 1 | 6 7 8 5',
        '6 7 8 5 | 2 3 4 1',
        '--------+--------',
        '3 4 1 2 | 7 8 5 6',
        '7 8 5 6 | 3 4 1 2',
        '--------+--------',
        '4 1 2 3 | 8 5 6 7',
        '8 5 6 7 | 4 1 2 3'
      ].join("\n")
      @sudoku_validator.valid?(valid_grid).must_equal true
    end

    it "returns false when given an invalid 8x8 grid (horizontal error)" do
      invalid_grid = [
        '1 2 3 4 | 5 6 7 8',
        '5 6 7 8 | 1 2 3 4',
        '--------+--------',
        '2 3 4 1 | 6 7 8 5',
        '6 7 8 5 | 2 3 4 1',
        '--------+--------',
        '3 4 1 2 | 7 8 5 2',
        '7 8 5 6 | 3 4 1 6',
        '--------+--------',
        '4 1 2 3 | 8 5 6 7',
        '8 5 6 7 | 4 1 2 3'
      ].join("\n")
      @sudoku_validator.valid?(invalid_grid).must_equal false
    end

    it "returns false when given an invalid 8x8 grid (vertical error)" do
      invalid_grid = [
        '1 2 3 4 | 5 6 7 8',
        '5 6 7 8 | 1 2 3 4',
        '--------+--------',
        '2 3 4 1 | 6 7 8 5',
        '6 7 8 5 | 2 3 4 1',
        '--------+--------',
        '3 4 1 2 | 7 8 5 6',
        '7 8 5 6 | 3 4 1 2',
        '--------+--------',
        '4 1 2 3 | 8 5 6 7',
        '8 5 6 7 | 4 2 1 3'
      ].join("\n")
      @sudoku_validator.valid?(invalid_grid).must_equal false
    end

    it "returns false when given an invalid 8x8 grid (box error)" do
      invalid_grid = [
        '1 2 3 4 | 5 6 7 8',
        '5 6 7 8 | 1 2 3 4',
        '--------+--------',
        '2 3 4 1 | 6 7 8 5',
        '6 7 8 5 | 2 3 4 1',
        '--------+--------',
        '3 4 1 2 | 7 8 5 6',
        '4 1 2 3 | 8 5 6 7',
        '--------+--------',
        '7 8 5 6 | 3 4 1 2',
        '8 5 6 7 | 4 1 2 3'
      ].join("\n")
      @sudoku_validator.valid?(invalid_grid).must_equal false
    end

    it "returns true when given a valid 16x16 grid" do
      valid_grid = [
        '0 1 2 3 | 4 5 6 7 | 8 9 a b | c d e f',
        '4 5 6 7 | 8 9 a b | c d e f | 0 1 2 3',
        '8 9 a b | c d e f | 0 1 2 3 | 4 5 6 7',
        'c d e f | 0 1 2 3 | 4 5 6 7 | 8 9 a b',
        '--------+---------+---------+--------',
        '1 2 3 0 | 5 6 7 4 | 9 a b 8 | d e f c',
        '5 6 7 4 | 9 a b 8 | d e f c | 1 2 3 0',
        '9 a b 8 | d e f c | 1 2 3 0 | 5 6 7 4',
        'd e f c | 1 2 3 0 | 5 6 7 4 | 9 a b 8',
        '--------+---------+---------+--------',
        '2 3 0 1 | 6 7 4 5 | a b 8 9 | e f c d',
        '6 7 4 5 | a b 8 9 | e f c d | 2 3 0 1',
        'a b 8 9 | e f c d | 2 3 0 1 | 6 7 4 5',
        'e f c d | 2 3 0 1 | 6 7 4 5 | a b 8 9',
        '--------+---------+---------+--------',
        '3 0 1 2 | 7 4 5 6 | b 8 9 a | f c d e',
        '7 4 5 6 | b 8 9 a | f c d e | 3 0 1 2',
        'b 8 9 a | f c d e | 3 0 1 2 | 7 4 5 6',
        'f c d e | 3 0 1 2 | 7 4 5 6 | b 8 9 a'
      ].join("\n")
      @sudoku_validator.valid?(valid_grid).must_equal true
    end

    it "returns false when given an invalid 16x16 grid (horizontal error)" do
      invalid_grid = [
        '0 1 2 3 | 4 5 6 7 | 8 9 a b | c d e f',
        '4 5 6 7 | 8 9 a b | c d e f | 0 1 2 3',
        '8 9 a b | c d e f | 0 1 2 3 | 4 5 6 7',
        'c d e f | 0 1 2 3 | 4 5 6 7 | 8 9 a b',
        '--------+---------+---------+--------',
        '1 2 3 0 | 5 6 7 4 | 9 a b 8 | d e f c',
        '5 6 7 4 | 9 a b 8 | d e f c | 1 2 3 0',
        '9 a b 8 | d e f c | 1 2 3 0 | 5 6 7 4',
        'd e f c | 1 2 3 0 | 5 6 7 4 | 9 a b 8',
        '--------+---------+---------+--------',
        '2 3 0 1 | 6 7 4 5 | a b 8 9 | e f c d',
        '6 7 4 5 | a b 8 9 | e f c d | 2 3 0 1',
        'a b 8 9 | e f c d | 2 3 0 1 | 6 b 4 5',
        'e f c d | 2 3 0 1 | 6 7 4 5 | a 7 8 9',
        '--------+---------+---------+--------',
        '3 0 1 2 | 7 4 5 6 | b 8 9 a | f c d e',
        '7 4 5 6 | b 8 9 a | f c d e | 3 0 1 2',
        'b 8 9 a | f c d e | 3 0 1 2 | 7 4 5 6',
        'f c d e | 3 0 1 2 | 7 4 5 6 | b 8 9 a'
      ].join("\n")
      @sudoku_validator.valid?(invalid_grid).must_equal false
    end

    it "returns false when given an invalid 16x16 grid (vertical error)" do
      invalid_grid = [
        '0 1 2 3 | 4 5 6 7 | 8 9 a b | c d e f',
        '4 5 6 7 | 8 9 a b | c d e f | 0 1 2 3',
        '8 9 a b | c d e f | 0 1 2 3 | 4 5 6 7',
        'c d e f | 0 1 2 3 | 4 5 6 7 | 8 9 a b',
        '--------+---------+---------+--------',
        '1 2 3 0 | 5 6 7 4 | 9 a b 8 | d e f c',
        '5 6 7 4 | 9 a b 8 | d e f c | 1 2 3 0',
        '9 a b 8 | d e f c | 1 2 3 0 | 5 6 7 4',
        'd e f c | 1 2 3 0 | 5 6 7 4 | 9 a b 8',
        '--------+---------+---------+--------',
        '2 3 0 1 | 6 7 4 5 | a b 8 9 | e f c d',
        '6 7 4 5 | a b 8 9 | e f c d | 2 3 0 1',
        'a b 8 9 | e f c d | 2 3 0 1 | 6 7 4 5',
        'e f c d | 2 3 0 1 | 6 7 4 5 | a b 8 9',
        '--------+---------+---------+--------',
        '3 0 1 2 | 7 4 5 6 | b 8 9 a | f c d e',
        '7 4 5 6 | b 8 9 a | f c d e | 3 0 1 2',
        'b 8 9 a | f c d e | 3 0 1 2 | 7 5 4 6',
        'f c d e | 3 0 1 2 | 7 4 5 6 | b 8 9 a'
      ].join("\n")
      @sudoku_validator.valid?(invalid_grid).must_equal false
    end

    it "returns false when given an invalid 16x16 grid (box error)" do
      invalid_grid = [
        '0 1 2 3 | 4 5 6 7 | 8 9 a b | c d e f',
        '4 5 6 7 | 8 9 a b | c d e f | 0 1 2 3',
        '8 9 a b | c d e f | 0 1 2 3 | 4 5 6 7',
        'c d e f | 0 1 2 3 | 4 5 6 7 | 8 9 a b',
        '--------+---------+---------+--------',
        '1 2 3 0 | 5 6 7 4 | 9 a b 8 | d e f c',
        '5 6 7 4 | 9 a b 8 | d e f c | 1 2 3 0',
        '9 a b 8 | d e f c | 1 2 3 0 | 5 6 7 4',
        'd e f c | 1 2 3 0 | 5 6 7 4 | 9 a b 8',
        '--------+---------+---------+--------',
        '2 3 0 1 | 6 7 4 5 | a b 8 9 | e f c d',
        '6 7 4 5 | a b 8 9 | e f c d | 2 3 0 1',
        'a b 8 9 | e f c d | 2 3 0 1 | 6 7 4 5',
        'b 8 9 a | f c d e | 3 0 1 2 | 7 4 5 6',
        '--------+---------+---------+--------',
        '3 0 1 2 | 7 4 5 6 | b 8 9 a | f c d e',
        '7 4 5 6 | b 8 9 a | f c d e | 3 0 1 2',
        'e f c d | 2 3 0 1 | 6 7 4 5 | a b 8 9',
        'f c d e | 3 0 1 2 | 7 4 5 6 | b 8 9 a'
      ].join("\n")
      @sudoku_validator.valid?(invalid_grid).must_equal false
    end

    it "returns true when given a valid 15x15 grid" do
      valid_grid = [
        '1 2 3 | 4 5 6 | 7 8 9 | a b c | d e f',
        '4 5 6 | 7 8 9 | a b c | d e f | 1 2 3',
        '7 8 9 | a b c | d e f | 1 2 3 | 4 5 6',
        'a b c | d e f | 1 2 3 | 4 5 6 | 7 8 9',
        'd e f | 1 2 3 | 4 5 6 | 7 8 9 | a b c',
        '------+-------+-------+-------+------',
        '2 3 1 | 5 6 4 | 8 9 7 | b c a | e f d',
        '5 6 4 | 8 9 7 | b c a | e f d | 2 3 1',
        '8 9 7 | b c a | e f d | 2 3 1 | 5 6 4',
        'b c a | e f d | 2 3 1 | 5 6 4 | 8 9 7',
        'e f d | 2 3 1 | 5 6 4 | 8 9 7 | b c a',
        '------+-------+-------+-------+------',
        '3 1 2 | 6 4 5 | 9 7 8 | c a b | f d e',
        '6 4 5 | 9 7 8 | c a b | f d e | 3 1 2',
        '9 7 8 | c a b | f d e | 3 1 2 | 6 4 5',
        'c a b | f d e | 3 1 2 | 6 4 5 | 9 7 8',
        'f d e | 3 1 2 | 6 4 5 | 9 7 8 | c a b'
      ].join("\n")
      @sudoku_validator.valid?(valid_grid).must_equal true
    end

    it "returns false when given an invalid 15x15 grid (horizontal error)" do
      invalid_grid = [
        '1 2 3 | 4 5 6 | 7 8 9 | a b c | d e f',
        '4 5 6 | 7 8 9 | a b c | d e f | 1 2 3',
        '7 8 9 | a b c | d e f | 1 2 3 | 4 5 6',
        'a b c | d e f | 1 2 3 | 4 5 6 | 7 8 9',
        'd e f | 1 2 3 | 4 5 6 | 7 8 9 | a b c',
        '------+-------+-------+-------+------',
        '2 3 1 | 5 6 4 | 8 9 7 | b c a | e f d',
        '5 6 4 | 8 9 7 | b c a | e f d | 2 3 1',
        '8 9 7 | b c a | e f d | 2 3 1 | 5 6 4',
        'b c a | e f d | 2 3 1 | 5 6 4 | 8 9 7',
        'e f d | 2 3 1 | 5 6 4 | 8 9 7 | b c a',
        '------+-------+-------+-------+------',
        '3 1 2 | 6 4 5 | 9 7 8 | c a b | f d e',
        '6 4 5 | 9 7 8 | c a b | f d e | 3 1 2',
        '9 7 8 | c a b | f d e | 3 1 2 | 9 4 5',
        'c a b | f d e | 3 1 2 | 6 4 5 | 6 7 8',
        'f d e | 3 1 2 | 6 4 5 | 9 7 8 | c a b'
      ].join("\n")
      @sudoku_validator.valid?(invalid_grid).must_equal false
    end

    it "returns false when given an invalid 15x15 grid (vertical error)" do
      invalid_grid = [
        '1 2 3 | 4 5 6 | 7 8 9 | a b c | d e f',
        '4 5 6 | 7 8 9 | a b c | d e f | 1 2 3',
        '7 8 9 | a b c | d e f | 1 2 3 | 4 5 6',
        'a b c | d e f | 1 2 3 | 4 5 6 | 7 8 9',
        'd e f | 1 2 3 | 4 5 6 | 7 8 9 | a b c',
        '------+-------+-------+-------+------',
        '2 3 1 | 5 6 4 | 8 9 7 | b c a | e f d',
        '5 6 4 | 8 9 7 | b c a | e f d | 2 3 1',
        '8 9 7 | b c a | e f d | 2 3 1 | 5 6 4',
        'b c a | e f d | 2 3 1 | 5 6 4 | 8 9 7',
        'e f d | 2 3 1 | 5 6 4 | 8 9 7 | b c a',
        '------+-------+-------+-------+------',
        '3 1 2 | 6 4 5 | 9 7 8 | c a b | f d e',
        '6 4 5 | 9 7 8 | c a b | f d e | 3 1 2',
        '9 7 8 | c a b | f d e | 3 1 2 | 6 4 5',
        'c a b | f d e | 1 3 2 | 6 4 5 | 9 7 8',
        'f d e | 3 1 2 | 6 4 5 | 9 7 8 | c a b'
      ].join("\n")
      @sudoku_validator.valid?(invalid_grid).must_equal false
    end

    it "returns false when given an invalid 15x15 grid (box error)" do
      invalid_grid = [
        '1 2 3 | 4 5 6 | 7 8 9 | a b c | d e f',
        '4 5 6 | 7 8 9 | a b c | d e f | 1 2 3',
        '7 8 9 | a b c | d e f | 1 2 3 | 4 5 6',
        'a b c | d e f | 1 2 3 | 4 5 6 | 7 8 9',
        'd e f | 1 2 3 | 4 5 6 | 7 8 9 | a b c',
        '------+-------+-------+-------+------',
        '2 3 1 | 5 6 4 | 8 9 7 | b c a | e f d',
        '5 6 4 | 8 9 7 | b c a | e f d | 2 3 1',
        'b c a | e f d | 2 3 1 | 5 6 4 | 8 9 7',
        'e f d | 2 3 1 | 5 6 4 | 8 9 7 | b c a',
        'c a b | f d e | 3 1 2 | 6 4 5 | 9 7 8',
        '------+-------+-------+-------+------',
        '3 1 2 | 6 4 5 | 9 7 8 | c a b | f d e',
        '6 4 5 | 9 7 8 | c a b | f d e | 3 1 2',
        '9 7 8 | c a b | f d e | 3 1 2 | 6 4 5',
        '8 9 7 | b c a | e f d | 2 3 1 | 5 6 4',
        'f d e | 3 1 2 | 6 4 5 | 9 7 8 | c a b'
      ].join("\n")
      @sudoku_validator.valid?(invalid_grid).must_equal false
    end

    it "returns false when given a nonsquare grid" do
      valid_grid = [
        '4 3 5 | 2 6 9 | 7 8 1',
        '6 8 2 | 5 7 1 | 4 9 3',
        '1 9 7 | 8 3 4 | 5 6 2',
        '------+-------+------',
        '8 2 6 | 1 9 5 | 3 4 7',
        '3 7 4 | 6 8 2 | 9 1 5',
        '9 5 1 | 7 4 3 | 6 2 8',
        '------+-------+------',
        '5 1 9 | 3 2 6 | 8 7 4',
        '2 4 8 | 9 5 7 | 1 3 6',
        '7 6 3 | 4 1 8 | 2 5 9 a'
      ].join("\n")
      @sudoku_validator.valid?(valid_grid).must_equal false
    end

    it "returns false when given a grid with too many values" do
      valid_grid = [
        '4 3 5 | 2 6 9 | 7 8 1',
        '6 8 2 | 5 7 1 | 4 9 3',
        '1 9 7 | 8 3 4 | 5 6 2',
        '------+-------+------',
        '8 2 6 | 1 9 5 | 3 4 7',
        '3 7 4 | 6 8 2 | 9 1 5',
        '9 5 1 | 7 4 3 | 6 2 8',
        '------+-------+------',
        '5 1 9 | 3 2 6 | 8 7 4',
        '2 4 8 | 9 5 7 | 1 3 6',
        '7 6 3 | 4 1 8 | 2 5 a'
      ].join("\n")
      @sudoku_validator.valid?(valid_grid).must_equal false
    end

    it "returns false when given a grid with nonuniform boxes (height)" do
      valid_grid = [
        '4 3 5 | 2 6 9 | 7 8 1',
        '6 8 2 | 5 7 1 | 4 9 3',
        '1 9 7 | 8 3 4 | 5 6 2',
        '8 2 6 | 1 9 5 | 3 4 7',
        '------+-------+------',
        '3 7 4 | 6 8 2 | 9 1 5',
        '9 5 1 | 7 4 3 | 6 2 8',
        '------+-------+------',
        '5 1 9 | 3 2 6 | 8 7 4',
        '2 4 8 | 9 5 7 | 1 3 6',
        '7 6 3 | 4 1 8 | 2 5 a'
      ].join("\n")
      @sudoku_validator.valid?(valid_grid).must_equal false
    end

    it "returns false when given a grid with an unexpected character in a box line" do
      valid_grid = [
        '4 3 5 | 2 6 9 | 7 8 1',
        '6 8 2 | 5 7 1 | 4 9 3',
        '1 9 7 | 8 3 4 | 5 6 2',
        '------+-------+------',
        '8 2 6 | 1 9 5 | 3 4 7',
        '3 7 4 | 6 8 2 | 9 1 5',
        '9 5 1 | 7 4 3 | 6 2 8',
        '------+---x---+------',
        '5 1 9 | 3 2 6 | 8 7 4',
        '2 4 8 | 9 5 7 | 1 3 6',
        '7 6 3 | 4 1 8 | 2 5 a'
      ].join("\n")
      @sudoku_validator.valid?(valid_grid).must_equal false
    end

    it "returns false when given a grid with nonuniform boxes (width)" do
      valid_grid = [
        '4 3 5 2 | 6 9 | 7 8 1',
        '6 8 2 5 | 7 1 | 4 9 3',
        '1 9 7 8 | 3 4 | 5 6 2',
        '--------+-----+------',
        '8 2 6 1 | 9 5 | 3 4 7',
        '3 7 4 6 | 8 2 | 9 1 5',
        '9 5 1 7 | 4 3 | 6 2 8',
        '--------+-----+------',
        '5 1 9 3 | 2 6 | 8 7 4',
        '2 4 8 9 | 5 7 | 1 3 6',
        '7 6 3 4 | 1 8 | 2 5 a'
      ].join("\n")
      @sudoku_validator.valid?(valid_grid).must_equal false
    end

    it "returns false when given a grid with an unexpected vertical line" do
      valid_grid = [
        '4 3 5 | 2 6 9 | 7 8 1',
        '6 8 2 | 5 7 1 | 4 9 3',
        '1 9 7 | 8 3 4 | 5 6 2',
        '------+-------+------',
        '8 2 6 | 1 9 5 | 3 4 7',
        '3 7 4 | 6 8 2 | 9 1 5',
        '9 5 1 | 7 4 3 | 6 2 8',
        '------+-------+------',
        '5 1 9 | 3 2 6 | 8 7 4',
        '2 4 8 | 9 | 7 | 1 3 6',
        '7 6 3 | 4 1 8 | 2 5 9'
      ].join("\n")
      @sudoku_validator.valid?(valid_grid).must_equal false
    end
  end
end
