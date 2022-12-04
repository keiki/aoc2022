within = 0

lines = File.open("input.txt").readlines.map(&:strip)

lines.each do |line|
  elf1, elf2 = line.split(',')
  
  elf1a, elf1b = elf1.split('-').map(&:to_i)
  elf2a, elf2b = elf2.split('-').map(&:to_i)
  
  elf1r = (elf1a..elf1b)
  elf2r = (elf2a..elf2b)
  
  within += 1 if (elf1r.cover?(elf2r) or elf2r.cover?(elf1r))
end