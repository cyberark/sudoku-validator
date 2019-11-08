class SudokuValidator
  def valid?(str)
    # convert string to @matrix
    box_height = convert_string_to_matrix(str)

    return false unless correctly_formatted_input?(str, box_height)

    # validate horizontal rows
    return false unless all_boxes_valid?(1)
    # validate vertical rows
    return false unless all_boxes_valid?(@matrix.count)
    # validate boxes
    return true if box_height.zero?

    all_boxes_valid?(box_height)
  end

  def all_boxes_valid?(box_height)
    box_width = @matrix.count / box_height
    box_width.times do |row_of_boxes|
      box_height.times do |col_of_boxes|
        unless single_box_valid?(box_height, row_of_boxes, col_of_boxes)
          return false
        end
      end
    end
    true
  end

  def single_box_valid?(box_height, row_of_boxes, col_of_boxes)
    box_width = @matrix.count / box_height
    row_items = []
    box_height.times do |row_within_box|
      box_width.times do |col_within_box|
        row_items.push(@matrix[row_of_boxes * box_height + row_within_box][
          col_of_boxes * box_width + col_within_box])
      end
    end
    row_items.uniq.count == @matrix.count
  end

  def convert_string_to_matrix(str)
    box_height = 0
    @matrix = []
    str.split("\n").each_with_index do |row, ix|
      if !row.include? '+'
        @matrix.push(row.split(/ \| | /))
      elsif box_height.zero?
        box_height = ix
      end
    end
    box_height
  end

  def correctly_formatted_input?(str, box_height)
    # check for proper input
    if @matrix.any? { |row| row.count != @matrix.count }
      puts 'Malformed input - grid is not square'
      return false
    end
    return false if @matrix.flatten.uniq.count > @matrix.count
    if @matrix.count % box_height != 0
      puts 'Malformed input - boxes are not uniform height'
      return false
    end
    box_width = @matrix.count / box_height
    str.split("\n").each_with_index do |row, ix|
      if ix % (box_height + 1) == box_height
        if row =~ /[^-\+]/
          puts 'Malformed input - invalid character found in horizontal box line'
          return false
        end
      else
        row.split(' ').each_with_index do |col, jx|
          if jx % (box_width + 1) == box_width
            if col != '|'
              puts 'Malformed input - boxes are not uniform width'
              return false
            end
          elsif col == '|'
            puts 'Malformed input - unexpected vertical box line'
            return false
          end
        end
      end
    end
    true
  end

end
