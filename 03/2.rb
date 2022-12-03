sum = 0

lines = File.open("input.txt").readlines.map(&:strip)

lines.each_slice(3) do |list|
  a, b, c = list.map{|x| x.split('')}
  overlap = a.intersection(b).intersection(c).first

  ordinal = overlap.ord
  
  if overlap.match /[a-z]/
    sum += ordinal - 97 + 1
  elsif overlap.match /[A-Z]/
    sum += ordinal - 65 + 27
  else
    #fuck you
  end
end