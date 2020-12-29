require_relative 'parse_input'

input = read_input
r_one = 0
r_two = 0

input.each do |line|
  pol, char, pass = line.split(' ')

  min, max = pol.split '-'
  min = min.to_i
  max = max.to_i
  char = char[0]

  cnt = pass.count(char)

  r_one += 1 if max.to_i >= cnt && min.to_i <= cnt

  if pass[min - 1] == char && pass[max - 1] != char
    r_two += 1
  elsif pass[min - 1] != char && pass[max - 1] == char
    r_two += 1
  end
end

puts r_one
puts r_two
