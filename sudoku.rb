require 'yaml'
puts "\n************************"
puts "Welcome to Sudoku!\n"
puts "We'll be playing a 9x9 version of the game."
puts "Remember: The objective of the game is to fill the board"
puts "such that each row, column, and 3x3 subgrid contains exactly"
puts "one instance of each number 1-9"
puts "************************"

puts "Please enter a 9x9 sudoku board below in the form of a valid 2D int array, 0 representing empty cells: "
input = gets.chomp
board = YAML.load(input)
board.flatten

def check_valid_size(board)
  return false if board.length != 9 # 9 rows
  board.each do |row|
    return false if row.length != 9 # 9 columns in each row
  end
  return true
end

def sudoku_solve(board){
  # Logic to solve the sudoku board. Use recursive backtracking
end

if check_valid_size(board)
  sudoku_solve(board)
else
  puts "Invalid Board Size... try again!"
end