require 'minitest/autorun'
require './sudoku_validator'

describe SudokuValidator do
  before do
    @sudoku_validator = SudokuValidator.new
  end

  describe ".validate" do
    it "returns true when given a valid grid" do
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
  end

  it "returns false when given a valid grid" do
    valid_grid = [
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
    @sudoku_validator.valid?(valid_grid).must_equal false
  end

end
