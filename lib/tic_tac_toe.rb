class TicTacToe

attr_accessor :board
  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], #Top row
    [3,4,5], #Middle row
    [6,7,8], #Bottom row
    [0,3,6], #Left vertical
    [1,4,7], #middle vertical
    [2,5,8], #right vertical
    [0,4,8], #diagonal from left to right
    [2,4,6]  #diagonal from right to left
  ]

  def display_board
   puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
   puts "-----------"
   puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
   puts "-----------"
   puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(position, char)
    @board[position] = char
  end

  def position_taken?(index_i)
    ((@board[index_i] == "X") || (@board[index_i] == "O"))
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    number_of_turns = 0
    @board.each do |space|
    if space == "X" || space == "O"
        number_of_turns += 1
    end
    number_of_turns
  end
end
  
end
