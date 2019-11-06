class SudokuValidator

  def valid?(str)
    # convert string to matrix
    box_height = 0
    matrix = []
    str.split("\n").each_with_index do |row, ix|
      if !row.include? "+"
        matrix.push(row.split(/ \| | /))
      elsif box_height == 0
        box_height = ix;
      end
    end
    num_values = matrix.count

    # validate horizontal rows
    (0..num_values-1).each do |jx|
      if !box_check(matrix, jx, jx, 0, num_values-1)
        return false
      end
    end

    # validate vertical rows
    (0..num_values-1).each do |kx|
      if !box_check(matrix, 0, num_values-1, kx, kx)
        return false
      end
    end

    # validate squares
    if box_height != 0
      box_width = num_values / box_height
      (0..num_values-box_height).step(box_height).each do |jx|
        (0..num_values-box_width).step(box_width).each do |kx|
          if !box_check(matrix, jx, jx + box_height - 1, kx, kx + box_width - 1)
            return false
          end
        end
      end
    end

    return true
  end

  def box_check(matrix, row_begin, row_end, col_begin, col_end)
    row_items = []
    (row_begin..row_end).each do |jx|
      (col_begin..col_end).each do |kx|
        row_items.push(matrix[jx][kx])
      end
    end
    if row_items.uniq.count < matrix.count
      return false
    end
    return true
  end

end
