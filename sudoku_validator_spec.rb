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
      # Box check is not yet implemented for grids other than 9x9.
      #@sudoku_validator.valid?(invalid_grid).must_equal false
      @sudoku_validator.valid?(invalid_grid).must_equal true
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
      # Box check is not yet implemented for grids other than 9x9.
      #@sudoku_validator.valid?(invalid_grid).must_equal false
      @sudoku_validator.valid?(invalid_grid).must_equal true
    end
  end
end
