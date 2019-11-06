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
    return false unless box_check(matrix, 1)
    # validate vertical rows
    return false unless box_check(matrix, matrix.count)
    # validate boxes
    return true if box_height == 0
    return box_check(matrix, box_height)
  end

  def box_check(matrix, box_height)
    box_width = matrix.count / box_height
    box_width.times do |box_x|
      box_height.times do |box_y|
        row_items = []
        box_height.times do |cell_x|
          box_width.times do |cell_y|
            row_items.push(matrix[box_x * box_height + cell_x][box_y * box_width + cell_y])
          end
        end
        return false unless row_items.uniq.count == matrix.count
      end
    end
    return true
  end

end
