require 'yaml'
require 'readline'

puts "\n************************"
puts "Welcome to Sudoku!\n"
puts "We'll be playing a 9x9 version of the game."
puts "Remember: The objective of the game is to fill the board"
puts "such that each row, column, and 3x3 subgrid contains exactly"
puts "one instance of each number 1-9"
puts "************************"

puts "Here's a template you can copy & paste to get you started:"
puts "[[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0], [0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0]]"
puts "\nPlease enter a 9x9 sudoku board below in the form of a valid 2D int array, 0 representing empty cells: "
input = Readline::readline.chomp
board = YAML.load(input)
board.flatten

def is_valid_size(grid)
  return false if grid.length != 9 # 9 rows
  grid.each do |row|
    return false if row.length != 9 # 9 columns in each row
  end
  return true
end

def has_valid_rows(grid)
  grid.each do |row| # checks the rows 
    (1..9).each do |i|
      if row.count(i) > 1
        return false
      end
    end
  end
  return true
end

def has_valid_columns(grid)
  transpose = [[],[],[],[],[],[],[],[],[]]
  grid.each do |row| # checks all the columns
    (0..8).each do |i|
      transpose[i].push(row[i])
    end
  end
  has_valid_rows(transpose)
end

def has_valid_subgrids(grid)
  temp = []
  (0..6).step(3) do |j|
    (0..6).step(3) do |i| 
      arr = []
      (j..j+2).each do |row|
        (i..i+2).each do |col|
          arr.push(grid[row][col])
        end
      end
      temp.push(arr)
    end
  end
  has_valid_rows(temp)
end

def is_valid_board(grid, i=nil, j=nil, num=nil)
  temp = Marshal.load(Marshal.dump(grid))
  temp[i][j] = num if num
  return has_valid_columns(temp) && has_valid_rows(temp) && has_valid_subgrids(temp)
end

if !is_valid_size(board)
  puts "Invalid size input, re-run the script to try again" 
  exit
elsif !is_valid_board(board)
  puts "Board cannot be solved"
  exit
else
  puts "\nNice input board, let's try to solve this!"
end

def sudoku_solve(grid)
  (0..8).each do |i|
    (0..8).each do |j|
      next unless grid[i][j] == 0
      (1..9).each do |num|
        if is_valid_board(grid, i, j, num)
          grid[i][j] = num
          if sudoku_solve(grid)
            return true
          else
            grid[i][j] = 0
          end
        end
      end
      return false
    end
  end
end

if sudoku_solve(board)
  board.each do |row|
    puts "#{row}"
  end
else
  puts "Board cannot be solved"
end