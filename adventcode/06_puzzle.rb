require_relative 'parse_input'
require 'pry'

input = File.read('input.txt').split "\n\n"
result_one = 0
result_two = 0

input.each do |l|
  a = {}
  questions = l.split "\n"
  questions.each do |q|
    q.split('').each do |i|
      if a.key? i
        a[i] += 1
      else
        a[i] = 1
      end
    end
  end

  # part one
  result_one += a.length

  # part two
  if questions.length == 1
    result_two += questions[0].length
  else
    a.each do |_k, v|
      result_two += 1 if v == questions.length
    end
  end
end

puts result_one
puts result_two
