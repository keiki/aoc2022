overlap = 0

lines = File.open("input.txt").readlines.map(&:strip)

lines.each do |line|
  elf1, elf2 = line.split(',')
  
  elf1a, elf1b = elf1.split('-').map(&:to_i)
  elf2a, elf2b = elf2.split('-').map(&:to_i)
  
  elf1r = (elf1a..elf1b).to_a
  elf2r = (elf2a..elf2b).to_a
  
  overlap += 1 if (elf1r | elf2r).size < (elf1r.size + elf2r.size)
end