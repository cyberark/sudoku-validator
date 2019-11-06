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
      return false unless box_check(matrix, jx, 1, 0, num_values)
    end

    # validate vertical rows
    (0..num_values-1).each do |kx|
      return false unless box_check(matrix, 0, num_values, kx, 1)
    end

    # validate squares
    return true if box_height == 0
    box_width = num_values / box_height
    (0..num_values-box_height).step(box_height).each do |jx|
      (0..num_values-box_width).step(box_width).each do |kx|
        return false unless box_check(matrix, jx, box_height, kx, box_width)
      end
    end

    return true
  end

  def box_check(matrix, row_begin, num_rows, col_begin, num_cols)
    row_items = []
    num_rows.times do |jx|
      num_cols.times do |kx|
        row_items.push(matrix[row_begin+jx][col_begin+kx])
      end
    end
    return row_items.uniq.count == matrix.count
  end

end
