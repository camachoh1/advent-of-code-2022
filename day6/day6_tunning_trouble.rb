## Part 1 ##

=begin 

Find the number of characters that need to be processed becored the first start-of-packet marker is detected.

A start-of-packet marker is indicated by a sequence of four characters that are all different. 

=end 



def parse_input(str)
  (0..str.size).each do |init|
    endpoint = init + 3
    str_chunk = str[init..endpoint]
    return str[0..endpoint].size if str[init..endpoint].chars.uniq.join == str[init..endpoint]
  end
end

# input_str = 'zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw'
input_str = File.read('day6_input.txt')
parse_input(input_str)

## Part 2 ##

=begin 

How many characters need to be proceesed before the first start of message marker is detected?

A start-of-message marker is just like a start-of-packet marker, except it consist of 14 distinct characters rather than 4.

=end

def parse_input(str)
  (0..str.size).each do |init|
    endpoint = init + 13
    str_chunk = str[init..endpoint]
    return str[0..endpoint].size if str[init..endpoint].chars.uniq.join == str[init..endpoint]
  end
end

# input_str = 'mjqjpqmgbljsphdztnvjfqwrcgsmlb'
input_str = File.read('day6_input.txt')
parse_input(input_str)
