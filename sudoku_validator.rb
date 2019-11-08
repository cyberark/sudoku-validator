class SudokuValidator

  def valid?(str)
    # convert string to matrix
    box_height = 0
    matrix = []
    str.split("\n").each_with_index do |row, ix|
      if !row.include? "+"
        matrix.push(row.split(/ \| | /))
      elsif box_height == 0
        box_height = ix
      end
    end

    return false unless correctly_formatted_input?(str, matrix, box_height)

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

  def correctly_formatted_input?(str, matrix, box_height)
    # check for proper input
    if matrix.any? { |row| row.count != matrix.count }
      puts "Malformed input - grid is not square"
      return false
    end
    return false if matrix.flatten.uniq.count > matrix.count
    if matrix.count % box_height != 0
      puts "Malformed input - boxes are not uniform height"
      return false
    end
    box_width = matrix.count / box_height
    str.split("\n").each_with_index do |row, ix|
      if ix % (box_height + 1) == box_height
        if row =~ /[^-\+]/
          puts "Malformed input - invalid character found in horizontal box line"
          return false
        end
      else
        row.split(" ").each_with_index do |col, jx|
          if jx % (box_width + 1) == box_width
            if col != "|"
              puts "Malformed input - boxes are not uniform width"
              return false
            end
          elsif col == "|"
            puts "Malformed input - unexpected vertical box line"
            return false
          end
        end
      end
    end
    return true
  end

end
