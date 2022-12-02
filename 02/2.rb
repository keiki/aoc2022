other = {A: :rock, B: :paper, C: :scissors}
winning = {rock: :scissors, paper: :rock, scissors: :paper}
scoring = {rock: 1, paper: 2, scissors: 3}
strategy = {X: :lose, Y: :draw, Z: :win}

score = 0

File.foreach("input.txt") do |line|
  them, me = line.split(' ').map(&:to_sym)
  
  my_strategy = strategy[me]
  
  their_throw = other[them]
  
  my_throw = case(my_strategy)
  when :lose
    score += 0
    winning[their_throw]
  when :draw
    score += 3
    their_throw
  when :win
    score += 6
    (winning.keys - [winning[their_throw], their_throw]).first
  end
  
  my_score = scoring[my_throw]
  score += my_score
end