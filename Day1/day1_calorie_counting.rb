
input_file = File.read('day1_input.txt')
input_arr = input_file.split(/\n\n/)
nums = input_arr.map {|s| s.split(/\n/)}

int_arr = nums.map do |arr|
    arr.map(&:to_i)
end 

# max_num = int_arr.max_by {|arr| arr.reduce(:+)}.sum

sorted = int_arr.sort_by {|arr| arr.sum}
top_three = sorted.reverse[0..2]
ans = top_three.map {|arr| arr.sum}.sum
ans