elves = []

File.foreach("input.txt") do |line|
  if line.strip.empty?
    elves << current
    
    current = 0
  else
    current += line.to_i
  end
end

elves.sort[-3..-1].sum