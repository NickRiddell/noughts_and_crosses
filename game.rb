class Game

  attr_reader :turn

  def initialize
    @board = [ [nil,nil,nil],[nil,nil,nil],[nil,nil,nil] ]
    @pieces = [:o, :x]
    @turn = 0
  end

  def place_piece(row,column)
    if out_of_range?(row,column)
      puts "Try playing on the board next time!"
      return false
    end
    if @board[ row ][ column ]
      puts "Already a piece there"
      return false
    end

    @board[ row ][ column ] =  @pieces[ @turn % 2 ]
    @turn += 1
    puts "Turn ##{self.turn}: \n"
    puts self.show_board
    self.has_won?(@board[ row ][ column ] )
    puts "\n"
    self.auto_reset
  end

  def show_board
    rows_strings = @board.map do |row|
      row_to_string(row)
    end
    rows_strings.join("\n_ _ _\n")
  end

  def flip_board
    puts "You threw the table and your toys out the pram. New Game!"
    self.new_game
  end

  def new_game
    @board = [ [nil,nil,nil],[nil,nil,nil],[nil,nil,nil] ]
    @turn = 0
    @pieces.rotate!
    puts self.show_board  
  end

  def auto_reset
    if @turn == 9
      puts "Board full! New game!"
      self.new_game
    end
  end

  def has_won?(symbol)
    if horizontal_line?(symbol, @board) || vertical_line?(symbol) || diagonal_line?(symbol)
      puts "\n"
      puts "Win! New game!"
      puts "\n"
      self.new_game
    end
  end

  def horizontal_line?(symbol, board)
    board.any? do |row|
      row_has_winning_line(row, symbol)
    end
  end

  def vertical_line?(symbol)
    transposed_board = @board.transpose
    horizontal_line?(symbol, transposed_board)
    
  end

  def diagonal_line?(symbol)
    middle_piece = @board[1][1]
    return false if middle_piece != symbol
    top_left_and_bottom_right = @board[0][0] ==symbol && @board[2][2]==symbol
    top_right_and_bottom_left = @board[0][2] ==symbol && @board[2][0]==symbol
    top_left_and_bottom_right || top_right_and_bottom_left
  end

  def row_has_winning_line(row, symbol)
    row.all? do |square|
      square == symbol
    end
  end

  # def turn(row, column)
  #   place_piece(row, column)
  #   puts show_board
  #   check_for_win()
  # end

  # def check_for_win
  #   if has_won(@pieces[ @turn % 2])
  #     puts "winner is #{@pieces [ @turn % 2] }"
  #     new_game
  #   elsif auto_reset
  #   end
  # end

  private

  def out_of_range?(row,column)
    row >= 3 || column >= 3
  end

  def row_to_string(row)
    row_symbols = row.map do |piece|
      piece || " "
    end
    row_symbols.join("|")
  end

end