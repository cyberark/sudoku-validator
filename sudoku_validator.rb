# frozen_string_literal: true

class SudokuValidator
  def valid?(str)
    rows = str.split("\n").reject { |r| r == '------+------+------' }
    valid_squares?(rows) && valid_horizontal_rows?(rows) && valid_vertical_rows?(rows)
  end

  private

  def valid_horizontal_rows?(rows)
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

  def valid_squares?(rows)
    row_indices = [0..2, 3..5, 6..8]
    column_indices = [0..5, 7..12, 15..20]
    valid_squares = row_indices.map do |row_index_range|
      column_indices.map do |column_index_range|
        square = rows[row_index_range].map { |row| row[column_index_range] }
        unique_numbers = square.join.gsub(/\s+/, '').split('').uniq
        return false if unique_numbers.count < 9
      end
    end
    true
  end
end
