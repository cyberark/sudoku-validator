class SudokuValidator

  def valid?(str)
    # validate horizontal rows
    str.split("\n").each do |row|
      if row != '------+-------+------'
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
    end

    # validate vertical rows
    i = 0
    column_index = 0
    while i < 9
      row_items = []
      str.split("\n").each { |row|
        if row != '------+-------+------'
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

        i += 1
      end

    # validate squares
    # squares blocks row 1
    i = 0
    if !boxCheck(str, 0, 2, 0, 2)
      return false
    end
    if !boxCheck(str, 0, 2, 4, 6)
      return false
    end
    if !boxCheck(str, 0, 2, 8, 10)
      return false
    end
    if !boxCheck(str, 4, 6, 0, 2)
      return false
    end
    if !boxCheck(str, 4, 6, 4, 6)
      return false
    end
    if !boxCheck(str, 4, 6, 8, 10)
      return false
    end
    if !boxCheck(str, 8, 10, 0, 2)
      return false
    end
    if !boxCheck(str, 8, 10, 4, 6)
      return false
    end
    if !boxCheck(str, 8, 10, 8, 10)
      return false
    end

    return true
  end

  def boxCheck(str, row_begin, row_end, col_begin, col_end)
    row_items = []
    str.split("\n").each_with_index do |row, j|
      row.split(' ').each_with_index do |col, k|
        if k >= col_begin and k <= col_end && j >= row_begin and j <= row_end
          row_items.push(col)
        end
      end
    end
    if row_items.uniq.count < 9
      return false
    end
    return true
  end

end
