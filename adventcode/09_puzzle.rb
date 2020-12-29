require_relative 'parse_input'
require 'pry'

input = read_input.map { |i| i.strip.to_i }

def check(numbers, num)
  i = 0

  while i < numbers.length
    j = 0
    while j < numbers.length
      return true if numbers[i] + numbers[j] == num && i != j

      j += 1
    end

    i += 1
  end
  false
end

numbers = []
wrong_num = nil
25.times do |i|
  numbers.unshift input[i]
end

# part one
input[25..].each do |n|
  if check(numbers, n)
    numbers.pop
    numbers.unshift n
  else
    wrong_num = n
    puts wrong_num
    break
  end
end

# part two
i = 0

while i < input.length
  j = i + 1
  sum_n = [input[i]]
  while j < input.length
    sum_n.append input[j]
    sum = sum_n.inject(0, :+)

    if sum == wrong_num
      sum_n.sort!
      puts sum_n[0] + sum_n[sum_n.length - 1]
    end

    j += 1
  end

  i += 1
end
