chars = File.open("06/input.txt").read.strip.split('')

def find_unique_segment_index(chars, length)
  found = false
  starter = 2

  while (!found && (starter < chars.size - 1))
    starter += 1
  
    indices = (0..(length-1)).to_a.map{|x| starter - x}.sort
  
    segment = indices.map{|i| chars[i]}
  
    found = true if segment.uniq.size == length
  end

  starter += 1
  
  return starter
end

find_unique_segment_index(chars, 14)