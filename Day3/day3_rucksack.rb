input_str = File.read('day3_input.txt')

## Part 1 ##

=begin 

- Each elf carrying a rucksack has two compartments.

- a string defines the elements in a runsack.

- each half of the string represents a compartment in the runsack

- identify priority items. Priority items are present in both compartments.

- get the score for the sum of all priority items.
  - lowercase letters a-z have values from 1-26.
  - uppercase letters A-Z have values from 27-52
=end

# input_str = 'vJrwpWtwJgWrhcsFMMfFFhFp
# jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
# PmmdzqPrVvPwwTWBwg
# wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
# ttgJtRGJQctTZtZT
# CrZsJsPPZsGzwwsLwLmpwMDw'

# LETTER_SCORE = ['',('a'..'z').to_a,("A".."Z").to_a].flatten

# def format_input(input) 
#   input_arr = input.split(/\n/)
# end

# def divide_compartments(arr)
#   compartments = []

#   arr.each do |str|
#     half_point = str.size / 2 - 1
#     compartments << [str[0..half_point], str[half_point + 1..-1]]
#   end
#   compartments
# end

# def find_priority_str(compartments)
#   compartments.map do |arr|
#     arr[0].chars & arr[1].chars
#   end.flatten
# end

# def calculate_priority_score(priority_items)
#   result = 0

#   priority_items.each do |el|
#     result += LETTER_SCORE.index(el)
#   end
#   result
# end

# input_arr = format_input(input_str)
# compartments = divide_compartments(input_arr)
# priority_elements = find_priority_str(compartments)
# score = calculate_priority_score(priority_elements)
# p score



## Part 2 ##

=begin 

identify the badge that each group of elves carry.

The input is divided into groups of 3.

find the common element in the three groups.

calculate the score of the badge for each group.

=end

# input_str = 'vJrwpWtwJgWrhcsFMMfFFhFp
# jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
# PmmdzqPrVvPwwTWBwg
# wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
# ttgJtRGJQctTZtZT
# CrZsJsPPZsGzwwsLwLmpwMDw'

LETTER_SCORE = ['',('a'..'z').to_a,("A".."Z").to_a].flatten

def format_input(input) 
  input_arr = input.split(/\n/)
end

def find_badge(groups)
  result = []

  groups.each do |arr|
    sorted_arr = arr.sort_by {|str| str.length}
    short_str = sorted_arr[0]
    result << short_str.chars.uniq.select do |char|
      sorted_arr[1].include?(char) && sorted_arr[-1].include?(char)
    end
  end
  result.flatten
end

def calculate_priority_score(priority_items)
  result = 0

  priority_items.each do |el|
    result += LETTER_SCORE.index(el)
  end
  result
end

input_arr = format_input(input_str)
groups_of_three = input_arr.each_slice(3).to_a
badge = find_badge(groups_of_three)
p score = calculate_priority_score(badge)

