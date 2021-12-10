require "logger"

class SudokuValidator

  def valid?(str)
    @logger = Logger.new(STDOUT)
     # validate horizontal rows
    @logger.debug("Valid rows result = " + valid_rows?(str).to_s)

    # validate vertical rows
    @logger.debug("Valid columns result = " + valid_columns?(str).to_s)


    # validate squares
    # squares blocks row 1
    i = 0
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

    return true
  end

  def valid_rows?(str)
    row_items = []
    rows = str.split("\n").reject { |y| y == "------+------+------" }
    rows.each do |row|
        cols = row.split(" ").reject { |x| x == "|" }
        cols.each do |col|
          row_items << col;
        end
      # Evaluate row for uniqueness
      if(row_items.uniq.count != 9)
        return false
      end
    end
    return true
  end

  def valid_columns?(str)
    for i in 0..8 do
      spacerCol = true;
      col_items = []
      # make rows instance var?
      rows = str.split("\n").reject { |y| y == "------+------+------" }
      rows.each do |row|
        break if row[i] == " " || row[i] ==  "|"
        col_items << row[i]
        spacerCol = false;
      end
      # Evaluate columns for uniqueness
      if(spacerCol == false && col_items.uniq.count != 9)
        @logger.debug("Validated column " + col_items.to_s)
        return false
      end
    end
    return true
  end  

  def valid_squares?(str)

    
  end


end
