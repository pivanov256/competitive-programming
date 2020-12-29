require_relative 'parse_input'
require 'pry'

input = '0,14,1,3,7,9'.split(',').map(&:to_i)

d = {}
last_num = nil
d[0] = []

input.each_with_index do |l, i|
  d[l] = [i + 1]
  last_num = l
end

cnt = input.length + 1
# part one
# n = 2020

# part two
n = 30_000_000
while cnt <= n
  if d.key? last_num
    if d[last_num].length > 1
      l = d[last_num].length
      last_num = d[last_num][l - 1] - d[last_num][l - 2]
      d[last_num] = [] unless d.key? last_num
      d[last_num].append(cnt)
    else
      d[0].append(cnt)
      last_num = 0
    end
  else
    d[0].append(cnt)
    last_num = 0
  end
  cnt += 1
end

puts last_num
