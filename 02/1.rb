other = {A: :rock, B: :paper, C: :scissors}
mine = {X: :rock, Y: :paper, Z: :scissors}
winning = {rock: :scissors, paper: :rock, scissors: :paper}
scoring = {rock: 1, paper: 2, scissors: 3}

score = 0

File.foreach("input.txt") do |line|
  them, me = line.split(' ').map(&:to_sym)
  
  my_throw = mine[me]
  my_score = scoring[my_throw]
  
  their_throw = other[them]
  
  score += my_score
  
  if my_throw == their_throw
    score += 3
  elsif winning[my_throw] == their_throw #win!
    score += 6
  else #boooooo
    score += 0
  end
end