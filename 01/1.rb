max = 0
current = 0

File.foreach("input.txt") do |line|
  if line.strip.empty?
    if current > max
      max = current
    end
    
    current = 0
  else
    current += line.to_i
  end
end

puts max