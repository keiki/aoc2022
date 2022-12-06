chars = File.open("06/input.txt").read.strip.split('')

found = false
starter = 2

while (!found && (starter < chars.size - 1))
  starter += 1
  
  indices = (0..3).to_a.map{|x| starter - x}.sort
  
  segment = indices.map{|i| chars[i]}
  
  found = true if segment.uniq.size == 4
end

starter += 1