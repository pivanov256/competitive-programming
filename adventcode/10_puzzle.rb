require_relative 'parse_input'
require 'pry'

input = read_input.map { |i| i.strip.to_i }
input.sort!

result = { 1 => 0, 2 => 0, 3 => 0 }

result[input[0]] += 1
result[3] += 1
used = []
diff = 4

i = 0
while i < input.length
  k = i + 1
  diff = 4
  while k < input.length
    unless used.include? input[k]
      a = (input[i] - input[k]).abs
      if a <= 3 && diff > a
        used.append(input[k])
        diff = a
      end
    end
    k += 1
  end

  result[diff] += 1 if diff <= 3
  i += 1
end

# part one
puts result[1] * result[3]

cash = { -3 => 0, -2 => 0, -1 => 0, 0 => 1 }

input.each do |n|
  n1 = 0
  n2 = 0
  n3 = 0
  n1 = cash[n - 1] if cash.key? n - 1
  n2 = cash[n - 2] if cash.key? n - 2
  n3 = cash[n - 3] if cash.key? n - 3

  cash[n] = n1 + n2 + n3
end

# part two
puts cash[input[-1]]
