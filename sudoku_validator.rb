# frozen_string_literal: true

class SudokuValidator
  attr_accessor :rows

  def initialize(str)
    @rows = str.split("\n").reject { |r| r == '------+------+------' }
  end

  def valid?
    valid_squares? && valid_horizontal_rows? && valid_vertical_rows?
  end

  private

  def valid_horizontal_rows?
    rows.map { |row| row.delete('|') }.each do |row|
      numbers = row.gsub(/\s+/, '').split('')
      return false if numbers.uniq.count < 9
    end
    true
  end

  def valid_vertical_rows?
    column_indices = (0..8)
    column_indices.each do |index|
      numbers = rows.map { |row| row.delete('|').gsub(/\s+/, '') }.map { |row| row[index] }.uniq
      return false if numbers.count < 9
    end
    true
  end

  def valid_squares?
    row_indices = [0..2, 3..5, 6..8]
    column_block_indices = [0, 1, 2]
    row_indices.map do |row_index|
      column_block_indices.map do |column_index|
        square = rows[row_index].map { |str| str.split(' | ') }.map { |arr| arr[column_index] }
        unique_numbers = square.join.gsub(/\s+/, '').split('').uniq
        return false if unique_numbers.count < 9
      end
    end
    true
  end
end
