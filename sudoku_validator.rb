class SudokuValidator

  def valid?(str)
    # validate horizontal rows
    str.split("\n").each do |row|
      next if row == '------+------+------'

      rowItems = []
      row.split(' ').each do |col|
        if col != '|'
          rowItems.push(col)
        end
      end
      puts rowItems.uniq.count
      if rowItems.uniq.count < 9
        return false
      end
    end

    # validate vertical rows
    column_index = 0
    9.times do
      row_items = []
      str.split("\n").each { |row|
        if row != '------+------+------'
          row_items << row[column_index]
        end
      }
      # puts "selected items: #{row_items.inspect}"
        if row_items.uniq.count < 9
          return false
        else
          column_index += 2
          if str.split("\n").first[column_index] == '|'
            column_index += 2
          end
        end

      end

    # validate squares
    # squares blocks row 1
    row_items = []
    str.split("\n").each_with_index do |row, j|
      row.split(' ').each_with_index do |col, k|
        if k >= 0 and k < 3 && j >=0 and j < 3
          # puts "col: #{col}"
          row_items.push(col)
        end
      end
    end
    if row_items.uniq.count < 9
      return false
    end

    row_items = []
    str.split("\n").each_with_index do |row, j|
      row.split(' ').each_with_index do |col, k|
        if k >= 4 and k < 7 && j >=0 and j < 3
          # puts "col: #{col}"
          row_items.push(col)
        end
      end
    end
    if row_items.uniq.count < 9
      return false
    end

    row_items = []
    str.split("\n").each_with_index do |row, j|
      row.split(' ').each_with_index do |col, k|
        if k >= 8 and k < 11 && j >=0 and j < 3
          row_items.push(col)
        end
      end
    end
    if row_items.uniq.count < 9
      return false
    end

    # squares blocks row 2
    row_items = []
    str.split("\n").each_with_index do |row, j|
      row.split(' ').each_with_index do |col, k|
        if k >= 0 and k < 3 && j >=4 and j < 7
          # puts "col: #{col}"
          row_items.push(col)
        end
      end
    end
    if row_items.uniq.count < 9
      return false
    end

    row_items = []
    str.split("\n").each_with_index do |row, j|
      row.split(' ').each_with_index do |col, k|
        if k >= 4 and k < 7 && j >=4 and j < 7
          row_items.push(col)
        end
      end
    end
    if row_items.uniq.count < 9
      return false
    end

    row_items = []
    str.split("\n").each_with_index do |row, j|
      row.split(' ').each_with_index do |col, k|
        if k >= 8 and k < 11 && j >=4 and j < 7
          row_items.push(col)
        end
      end
    end
    if row_items.uniq.count < 9
      return false
    end

    # squares blocks row 3
    row_items = []
    str.split("\n").each_with_index do |row, j|
      row.split(' ').each_with_index do |col, k|
        if k >= 0 and k < 3 && j >=8 and j < 11
          row_items.push(col)
        end
      end
    end
    if row_items.uniq.count < 9
      return false
    end

    row_items = []
    str.split("\n").each_with_index do |row, j|
      row.split(' ').each_with_index do |col, k|
        if k >= 4 and k < 7 && j >=8 and j < 11
          row_items.push(col)
        end
      end
    end
    if row_items.uniq.count < 9
      return false
    end

    row_items = []
    str.split("\n").each_with_index do |row, j|
      row.split(' ').each_with_index do |col, k|
        if k >= 8 and k < 11 && j >=8 and j < 11
          row_items.push(col)
        end
      end
    end
    if row_items.uniq.count < 9
      return false
    end

    true
  end

end
