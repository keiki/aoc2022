lines = File.open("input.txt").readlines.map(&:chomp)

maplines = []
i = 0

while !lines[i].empty?
  maplines << lines[i]
  i+= 1
end

lines = lines[i+1..]

num_cols = maplines.last.split('').uniq.max.to_i

maplines = maplines[0...-1]

cols = {}
num_cols.times { |i| cols[i+1] = []}

maplines.each do |mline|
  mchars = mline.split('')
  
  mchars.each_slice(4).with_index do |(*chars), i|
    if box = chars.join.match(/[A-Z]/)
      cols[i+1].unshift box.to_s
    end
  end
end

re = /move ([0-9]+) from ([0-9]+) to ([0-9]+)/

lines.each do |line|
  matches = line.match re
  counter = matches[1].to_i
  from_col = matches[2].to_i
  to_col = matches[3].to_i
  
  tmp = []
  
  counter.times do |x|
    tmp.push(cols[from_col].pop)
  end
  
  counter.times do |x|
    cols[to_col].push(tmp.pop)
  end
end

str = ""
cols.each do |k, v|
  str << v.last.to_s
end