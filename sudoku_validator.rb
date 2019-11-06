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
    for jx in 0..8
      if !boxCheck(matrix, jx, jx, 0, 8)
        return false
      end
    end

    # validate vertical rows
    for kx in 0..8
      if !boxCheck(matrix, 0, 8, kx, kx)
        return false
      end
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
