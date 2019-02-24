require 'yaml'
puts "\n************************"
puts "Welcome to Sudoku!\n"
puts "We'll be playing a 9x9 version of the game."
puts "Remember: The objective of the game is to fill the board"
puts "such that each row, column, and 3x3 subgrid contains exactly"
puts "one instance of each number 1-9"
puts "************************"

puts "Please enter a 9x9 sudoku board below in the form of a valid 2D int array: "
input = gets.chomp
array = YAML.load(input)
array.flatten