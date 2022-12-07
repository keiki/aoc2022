MAX_DIR_SIZE = 100000

def run_command(command, filesystem, pwd, here)
  if command.match /\$/
    if cdx = command.match(/\$ cd (.*)/)
      dir = cdx[1]
      
      if dir == '/'
        here = filesystem
      elsif dir == '..'
        pwd.pop
        here = pwd.empty? ? filesystem : filesystem.dig(*pwd)
      else
        pwd << dir
        here = here[dir]
      end
    elsif command.match /\$ ls/
      #wait for list
    else
      #welp
    end
  else
    # outputting from previous function
    if command.match /^dir/
      command, dirname = command.split(' ')
      here[dirname] = {}
    else
      #file
      size, filename = command.split(' ')
      here[filename] = size.to_i
    end
  end
  
  return filesystem, pwd, here
end

def completely_flatten(hash)
  hash.flatten.map{|el| el.is_a?(Hash) ? completely_flatten(el) : el}.flatten
end

def obj_size(obj)
  if obj.is_a? Hash
    info = completely_flatten(obj)
    info.select{|x| x.is_a? Integer}.sum
  else
    return obj
  end
end

def determine_dirs_under(filesystem, under=100000)
  passing = []
  
  filesystem.keys.each do |key|
    dir = filesystem[key]
    
    if dir.is_a? Hash
      size = obj_size(dir)
    
      if size <= under
        passing << size
      end
      
      passing = passing + determine_dirs_under(dir)
    end
  end
  
  return passing
end

file = File.open("input.txt").readlines.map(&:strip)

filesystem = {}
pwd = []
here = filesystem

file.each do |command|
  filesystem, pwd, here = run_command(command, filesystem, pwd, here)
end

passing = determine_dirs_under(filesystem, MAX_DIR_SIZE)

passing.sum