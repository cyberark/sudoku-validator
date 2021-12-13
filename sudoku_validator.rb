class SudokuValidator

	def valid?(str)
    @rows = str.split("\n").reject { |y| y == "------+------+------" }
		return valid_rows? && valid_columns? && valid_squares?
	end

	def valid_rows?
		row_items = []
		@rows.each do |row|
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

	def valid_columns?
		for i in 0..8 do
			spacerCol = true;
			col_items = []
			@rows.each do |row|
				break if row[i] == " " || row[i] ==  "|"
				col_items << row[i]
				spacerCol = false;
			end
			# Evaluate column for uniqueness
			if(spacerCol == false && !is_unique?(col_items))
				return false
			end
		end
		return true
	end  

	def valid_squares?
		squares = [[],[],[],[],[],[],[],[],[]];
		x = 0
		@rows.each do |row|
			cols = row.split(" ").reject { |x| x == "|" }
			y = 0
			cols.each do |col|
				case x
				when 0..2
					case y
					when 0..2
						squares[0].push(col)
					when 3..5
						squares[1].push(col)
					when 6..8
						squares[2].push(col)
					end
				when 3..5
					case y
					when 0..2
						squares[3].push(col)
					when 3..5
						squares[4].push(col)
					when 6..8
						squares[5].push(col)
					end
				when 6..8
					case y
					when 0..2
						squares[6].push(col)
					when 3..5
						squares[7].push(col)
					when 6..8
						squares[8].push(col)
					end
				end
				y += 1
			end
			x += 1
		end

    # Evaluate each square for uniqueness
		squares.each do |square|
			if !is_unique?(square) 
				return false
			end

		end
		return true
	end

	def is_unique?(items)
		return items.uniq.count == 9
	end

end
