class SudokuValidator

  def valid?(str)
    # convert string to matrix
    boxHeight = 0
    matrix = []
    str.split("\n").each_with_index do |row, ix|
      if !row.include? "+"
        matrix.push(row.split(/ \| | /))
      elsif boxHeight == 0
        boxHeight = ix;
      end
    end
    numValues = matrix.count

    # validate horizontal rows
    for jx in 0..numValues-1
      if !boxCheck(matrix, jx, jx, 0, numValues-1)
        return false
      end
    end

    # validate vertical rows
    for kx in 0..numValues-1
      if !boxCheck(matrix, 0, numValues-1, kx, kx)
        return false
      end
    end

    # validate squares
    if boxHeight != 0
      boxWidth = numValues / boxHeight
      for jx in (0..numValues-boxHeight).step(boxHeight)
       for kx in (0..numValues-boxWidth).step(boxWidth)
         if !boxCheck(matrix, jx, jx + boxHeight - 1, kx, kx + boxWidth - 1)
           return false
         end
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
    if row_items.uniq.count < matrix.count
      return false
    end
    return true
  end

end
