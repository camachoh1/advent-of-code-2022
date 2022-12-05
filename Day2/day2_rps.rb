# =begin

# The first column is what your opponent is going to play: A for rock, B for paper, and C for scissors.

# The second column, must be what you should play in response: X for rock, Y for paper, and Z for scissors. 

# Total score is the sum of your scores for each round. 

# Score for a single round is the score for the shape you selected: 1 for rock, 2 for paper, and 3 for scissoes. Pus the score for the outcome of the round: 0 if you lost, 3 if the round was a draw and 6 if you won.

# calculate the total score if everything goes exactly as your strategy guide. 

# =end


## Part 1 ##
input_str = File.read('day2_input.txt')

# input_str = 'A Y
# B X
# C Z'

def format_input(input) 
  input_arr = input.split(/\n\n/)
  input_pairs = input_arr.map {|s| s.split(/\n/)}.flatten
end

def format_moves(input_arr)
  moves = []
  input_arr.each do |pair|
    moves << pair.chars.select {|c| c != ' '}
  end
  moves
end

input_arr = format_input(input_str)
moves_arr = format_moves(input_arr)

def tie?(moves)
  moves[0] == "A" && moves[1] == "X" || moves[0] == "B" && moves[1] == "Y" || moves[0] == "C" && moves[1] == "Z"
end

def tie_score(moves)
  if moves[0] == "A" && moves[1] == "X"
    4
  elsif moves[0] == "B" && moves[1] == "Y"
    5
  else moves[0] == "C" && moves[1] == "Z"
    6
  end
end

def losing_score(moves)
  if moves[0] == "A" && moves[1] == "Z"
    3
  elsif moves[0] == "B" && moves[1] == "X"
    1
  else moves[0] == "C" && moves[1] == "Y"
    2
  end
end

def human_scores(moves)
  human = 0

  moves.each do |arr1|

    if tie?(arr1)
      human += tie_score(arr1)
    elsif arr1[0] == "A" && arr1[1] == "Y"
      human += tie_score(arr1)
    elsif arr1[0] == "B" && arr1[1] == "Z"
      human += 9
    elsif arr1[0] == "C" && arr1[1] == "X"
      human += 7
    else 
      human += losing_score(arr1)
    end
  end
  human
end

p human_scores(moves_arr)

## Part 2 ##


=begin 

The second column actually says how the round needs to end: X means you need to lose, Y means you need to end the round in a draw and Z means you need to win. 
=end 

# input_str = 'A Y
# B X
# C Z'

# def format_input(input) 
#   input_arr = input.split(/\n\n/)
#   input_pairs = input_arr.map {|s| s.split(/\n/)}.flatten
# end

# def format_moves(input_arr)
#   moves = []
#   input_arr.each do |pair|
#     moves << pair.chars.select {|c| c != ' '}
#   end
#   moves
# end

# input_arr = format_input(input_str)
# moves_arr = format_moves(input_arr)

# def tie_score(moves)
#   if moves[0] == "A" #&& moves[1] == "X"
#     4
#   elsif moves[0] == "B" #&& moves[1] == "Y"
#     5
#   else moves[0] == "C" #&& moves[1] == "Z"
#     6
#   end
# end

# def losing_score(moves)
#   if moves[0] == "A" #&& moves[1] == "Z"
#     3
#   elsif moves[0] == "B" #&& moves[1] == "X"
#     1
#   else moves[0] == "C" #&& moves[1] == "Y"
#     2
#   end
# end

# def winning_score(moves)
#   if moves[0] == "A" #&& moves[1] == "Z"
#     8
#   elsif moves[0] == "B" #&& moves[1] == "X"
#     9
#   else moves[0] == "C" #&& moves[1] == "Y"
#     7
#   end
# end

# def human_scores(moves)
#   human = 0

#   moves.each do |arr1|

#     if arr1[1] == "X"
#       human += losing_score(arr1)
#     elsif arr1[1] == "Y"
#       human += tie_score(arr1)
#     elsif arr1[1] == "Z"
#       human += winning_score(arr1)
#     end
#   end
#   human
# end

# p human_scores(moves_arr)