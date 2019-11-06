class SudokuValidator

  def valid?(str)
    # convert string to matrix
    matrix = []
    str.split("\n").each do |row|
      if !row.include? "+"
        matrix.push(row.split(/ \| | /))
      end
    end
    p matrix

    # validate horizontal rows
    str.split("\n").each do |row|
      if !row.include? "+"
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
    ix = 0
    column_index = 0
    while ix < 9
      row_items = []
      str.split("\n").each { |row|
        if !row.include? "+"
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

        ix += 1
      end

    # validate squares
    for jx in [0, 3, 6]
      for kx in [0, 3, 6]
        if !boxCheck(matrix, jx, jx + 2, kx, kx + 2)
          return false
        end
      end
    end

    return true
  end

  def boxCheck(matrix, row_begin, row_end, col_begin, col_end)
    row_items = []
    for jx in row_begin..row_end
      for kx in col_begin..col_end
        row_items.push(matrix[jx][kx])
      end
    end
    if row_items.uniq.count < 9
      return false
    end
    return true
  end

end
