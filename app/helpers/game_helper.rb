module GameHelper

  def top_scorer_for_game(game)
    winners = Match.where(game_id: game.id).group_by(&:winner)
    if winners.size < 1
      return "No winners"
    end
    biggest = winners.first
    winners.each do |winner, wins|
      if wins.size > biggest.size
        biggest = winner
      end
    end
    [biggest.first, biggest[1].size]
  end

def tic_tac_toe_places
    @places = {
    "a1"=>" ","a2"=>" ","a3"=>" ",
    "b1"=>" ","b2"=>" ","b3"=>" ",
    "c1"=>" ","c2"=>" ","c3"=>" "
  }
end
def tic_tac_tow_columns
    @columns = [
    ['a1','a2','a3'],
    ['b1','b2','b3'],
    ['c1','c2','c3'],
    ['a1','b1','c1'],
    ['a2','b2','c2'],
    ['a3','b3','c3'],
    ['a1','b2','c3'],
    ['c1','b2','a3']
  ]
end

def turn
  if(@user == 'X')
  user_turn
  else
    cpu_turn
  end
end

  def draw_game
    puts " 1 #{@places["a1"]}|#{@places["b1"]}|#{@places["c1"]}"
    puts "   -----"
    puts " 2 #{@places["a2"]}|#{@places["b2"]}|#{@places["c2"]}"
    puts "   -----"
    puts " 3 #{@places["a3"]}|#{@places["b3"]}|#{@places["c3"]}"
  end

# def cpu_turn
#   move = cpu_find_move
#   @places[move] = @cpu
#   put_line
#   puts "#{@cpu_name} marks #{move.upcase}"
#   check_game(@user)
# end

# def times_in_column arr, item
#   times = 0
#   arr.each do |i|
#     times += 1 if @places[i] == item
#     unless @places[i] == item || @places[i] == " "
#       #oppisite piece is in column so column cannot be used for win.
#       #therefore, the strategic thing to do is choose a dif column so return 0.
#       return 0
#     end
#   end
#   times
# end

# def empty_in_column arr
#   arr.each do |i|
#     if @places[i] == " "
#       return i
#     end
#   end
# end

# @columns.each do |column|
#   if times_in_column(column, @cpu) == 2
#     return empty_in_column column
#   end
# end

# @columns.each do |column|
#   if times_in_column(column, @user) == 2
#     return empty_in_column column
#   end
# end

# @columns.each do |column|
#   if times_in_column(column, @cpu) == 1
#     return empty_in_column column
#   end
# end

# #no strategic spot found so just find a random empty
# k = @places.keys;
# i = rand(k.length)
# if @places[k[i]] == " "
#   return k[i]
# else
#   #random selection is taken so just find the first empty slot
#   @places.each { |k,v| return k if v == " " }
# end

# def user_turn
#   put_line
#   puts " RUBY TIC TAC TOE"
#   draw_game
#   puts " #{@user_name}, please make a move or type 'exit' to quit"
#   STDOUT.flush
#   input = gets.chomp.downcase
#   put_bar
#   if input.length == 2
#     a = input.split("")
#     if(['a','b','c'].include? a[0])
#       if(['1','2','3'].include? a[1])
#         if @places[input] == " "
#           @places[input] = @user
#           put_line
#           puts "#{@user_name} marks #{input.upcase}"
#           check_game(@cpu)
#         else
#           wrong_move
#         end
#       else
#         wrong_input
#       end
#     else
#       wrong_input
#     end
#   else
#     wrong_input unless input == 'exit'
#   end
# end

# def wrong_input
#   put_line
#   puts "Please specify a move with the format 'A1' , 'B3' , 'C2' etc."
#   user_turn
# end

# def wrong_move
#   put_line
#   puts "You must choose an empty slot"
#   user_turn
# end

# def check_game(next_turn)
#   game_over = nil
#   @columns.each do |column|
#     # see if cpu has won
#     if times_in_column(column, @cpu) == 3
#       put_line
#       puts "Game Over -- #{@cpu_name} WINS!!!"
#       game_over = true
#     end
#     # see if user has won
#     if times_in_column(column, @user) == 3
#       put_line
#       puts "Game Over -- #{@user_name} WINS!!!"
#       game_over = true
#     end
#   end
#   unless game_over
#     if(moves_left > 0)
#       if(next_turn == @user)
#         user_turn
#       else
#         cpu_turn
#       end
#     else
#       put_line
#       puts "Game Over -- DRAW!"
#     end
#   end
# end

# def moves_left
#   slots = 0
#   @places.each do |k, v|
#     slots += 1 if v == " "
#   end
#   slots
# end

# end
end


