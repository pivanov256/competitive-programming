require_relative 'parse_input'
require 'pry'

input = read_input

l = input.length
w = input[0].length

a = w / 7
b = (l / a) + 1

input1 = []

input.each do |l|
  str = ''
  b.times do |_i|
    str.concat(l.strip)
  end

  input1.append(str)
end

rn_one = 0
rn_two = 1

%w[1-1 3-1 5-1 7-1 1-2].each do |n|
  x = 0
  z = 0
  r = 0

  stepl, stepd = n.split '-'
  loop do
    x += stepl.to_i
    z += stepd.to_i
    break if z > input1.length - 1

    s = input1[z][x]
    r += 1 if s == '#'
  end
  rn_one = r if stepl == '3' && stepd == '1'
  rn_two *= r
end

puts rn_one
puts rn_two
