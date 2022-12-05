crates = { 
  1 => ['S', 'C', 'V', 'N'],
  2 => ['Z', 'M', 'J', 'H', 'N', 'S'],
  3 => ['M', 'C', 'T', 'G', 'J', 'N', 'D'],
  4 => ['T', 'D', 'F', 'J', 'W', 'R', 'M'],
  5 => ['P', 'F', 'H'],
  6 => ['C', 'T', 'Z', 'H', 'J'],
  7 => ['D', 'P', 'R', 'Q', 'F', 'S', 'L', 'Z'],
  8 => ['C', 'S', 'L', 'H', 'D', 'F', 'P', 'W'],
  9 => ['D', 'S', 'M', 'P', 'F', 'N', 'G', 'Z']}

## Part 1 ## 

def format_instructions(instructions)
  instructions_arr = instructions.split(/\n/)
  
  numbers_str = instructions_arr.map {|str| str.split(/[a-z]/)}
  
  clean_numbers = numbers_str.map do |arr|
    arr.select {|s| s.size > 0}
  end.map {|a| a.map(&:to_i)}
  clean_numbers
end

def move_crates(crates, instructions)
  instructions.each do |subarr|
    quantity = subarr[0]
    from = subarr[1]
    to = subarr[2]

    quantity.times do 
      crates[to] << crates[from].pop
    end
  end
  crates
end

def top_crates(crates)
  result = []
  crates.each do |_, cr|
    result << cr[-1]
  end
  result.join
end

# instructions_n = [[1,2,1], [3,1,3], [2,2,1], [1,1,2]]
# crates = {1 => ['Z', 'N'], 2 => ['M', 'C', 'D'], 3 => ['P']}

instructions_text = File.read('day5_input.txt')
instructions_n = format_instructions(instructions_text)
new_order = move_crates(crates, instructions_n)
p top_crates(new_order)


## Part 2 ##


def format_instructions(instructions)
  instructions_arr = instructions.split(/\n/)
  
  numbers_str = instructions_arr.map {|str| str.split(/[a-z]/)}
  
  clean_numbers = numbers_str.map do |arr|
    arr.select {|s| s.size > 0}
  end.map {|a| a.map(&:to_i)}
  clean_numbers
end


def move_crates(crates, instructions)
  buffer = []
  instructions.each do |subarr|
    quantity = subarr[0]
    from = subarr[1]
    to = subarr[2]

    quantity.times do 
      buffer << crates[from].pop
    end

    quantity.times do 
      crates[to] << buffer.pop
    end
  end
  crates
end

def top_crates(crates)
  result = []
  crates.each do |_, cr|
    result << cr[-1]
  end
  result.join
end

# instructions_n = [[1,2,1], [3,1,3], [2,2,1], [1,1,2]]
# crates = {1 => ['Z', 'N'], 2 => ['M', 'C', 'D'], 3 => ['P']}

instructions_text = File.read('day5_input.txt')
instructions_n = format_instructions(instructions_text)
new_order = move_crates(crates, instructions_n)
p top_crates(new_order)