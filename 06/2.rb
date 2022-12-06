chars = File.open("input.txt").read.strip.split('')

def find_unique_segment_index(chars, length)
  found = false
  starter = length - 1

  while (!found && (starter < chars.size - 1))
    starter += 1
  
    segment = (0..(length-1)).to_a.map{|x| starter - x}.sort.map{|i| chars[i]}
  
    found = true if segment.uniq.size == length
  end

  starter += 1
  
  return starter
end

find_unique_segment_index(chars, 14)