


=begin

the input consist of a string containing pairs of ranges.

Some ranges partially contain other values from other ranges.

While some fully contain the other range.

count the number of ranges that fully contain the other.

=end
input_str = File.read('day4_input.txt')
# input_str = '2-4,6-8
# 2-3,4-5
# 5-7,7-9
# 2-8,3-7
# 6-6,4-6
# 2-6,4-8
# 20-81,21-80'

def format_input(input) 
  input_arr = input.split(/\n/)
  dash_arr = input_arr.map {|s| s.split(',')}
end

def format_range(arr)
  result = []

  arr.each do |a|
    result << a.map do |str|
      splitted_str = str.split('-').map(&:to_i)
      (splitted_str[0]..splitted_str[-1]).to_a
    end
  end
  result
end

def range_count(ranges)
  count = 0
  overlap_count = 0

  ranges.each do |arr|

    count += 1 if arr[0].all? {|n| arr[1].include?(n)} || arr[1].all? {|n1| arr[0].include?(n1)}

    overlap_count += 1 if arr[0].any? {|el| arr[1].include?(el)}
  end
  [count, overlap_count]
end

input = format_input(input_str)
ranges = format_range(input)
p range_count(ranges)