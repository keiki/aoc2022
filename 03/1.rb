sum = 0

File.foreach("input.txt") do |line|
  chars = line.split('')
  first = chars[0...(chars.size/2)]
  second = chars[(chars.size/2)..]
  
  overlap = first.uniq.intersection(second.uniq).first
  
  ordinal = overlap.ord
  
  if overlap.match /[a-z]/
    sum += ordinal - 97 + 1
  elsif overlap.match /[A-Z]/
    sum += ordinal - 65 + 27
  else
    #fuck you
  end
end