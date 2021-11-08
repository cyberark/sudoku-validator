class SudokuValidator
  def valid?(str)

    return false unless valid_horizontal_rows?(str) && valid_vertical_rows?(str)

    # validate squares
    # squares blocks row 1
    row_items = []
    str.split("\n").each_with_index do |row, j|
      row.split(' ').each_with_index do |col, k|
        row_items.push(col) if k >= 0 && k < 3 && j >= 0 && j < 3
      end
    end
    return false if row_items.uniq.count < 9

    row_items = []
    str.split("\n").each_with_index do |row, j|
      row.split(' ').each_with_index do |col, k|
        row_items.push(col) if k >= 4 && k < 7 && j >= 0 && j < 3
      end
    end
    return false if row_items.uniq.count < 9

    row_items = []
    str.split("\n").each_with_index do |row, j|
      row.split(' ').each_with_index do |col, k|
        row_items.push(col) if k >= 8 && k < 11 && j >= 0 && j < 3
      end
    end
    return false if row_items.uniq.count < 9

    # squares blocks row 2
    row_items = []
    str.split("\n").each_with_index do |row, j|
      row.split(' ').each_with_index do |col, k|
        row_items.push(col) if k >= 0 && k < 3 && j >= 4 && j < 7
      end
    end
    return false if row_items.uniq.count < 9

    row_items = []
    str.split("\n").each_with_index do |row, j|
      row.split(' ').each_with_index do |col, k|
        row_items.push(col) if k >= 4 && k < 7 && j >= 4 && j < 7
      end
    end
    return false if row_items.uniq.count < 9

    row_items = []
    str.split("\n").each_with_index do |row, j|
      row.split(' ').each_with_index do |col, k|
        row_items.push(col) if k >= 8 && k < 11 && j >= 4 && j < 7
      end
    end
    return false if row_items.uniq.count < 9

    # squares blocks row 3
    row_items = []
    str.split("\n").each_with_index do |row, j|
      row.split(' ').each_with_index do |col, k|
        row_items.push(col) if k >= 0 && k < 3 && j >= 8 && j < 11
      end
    end
    return false if row_items.uniq.count < 9

    row_items = []
    str.split("\n").each_with_index do |row, j|
      row.split(' ').each_with_index do |col, k|
        row_items.push(col) if k >= 4 && k < 7 && j >= 8 && j < 11
      end
    end
    return false if row_items.uniq.count < 9

    row_items = []
    str.split("\n").each_with_index do |row, j|
      row.split(' ').each_with_index do |col, k|
        row_items.push(col) if k >= 8 && k < 11 && j >= 8 && j < 11
      end
    end
    return false if row_items.uniq.count < 9

    true
  end

  private

  def valid_horizontal_rows?(str)
    # validate horizontal rows
    str.split("\n").each do |row|
      next if row == '------+------+------'

      row_items = []
      row.split(' ').each do |col|
        row_items.push(col) if col != '|'
      end
      return false if row_items.uniq.count < 9
    end
  end

  def valid_vertical_rows?(str)
    # validate vertical rows
    column_index = 0
    9.times do
      row_items = []
      str.split("\n").each do |row|
        row_items << row[column_index] if row != '------+------+------'
      end
      return false if row_items.uniq.count < 9

      column_index += 2
      column_index += 2 if str.split("\n").first[column_index] == '|'
    end
  end
end
