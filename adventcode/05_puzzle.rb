require_relative 'parse_input'
require 'pry'

input = read_input

a = []
seats = {}
input.each do |l|
  cnt = 0
  d = 0
  u = 127
  r = nil
  7.times do |_i|
    if l[cnt] == 'F'
      u = d + ((u - d) / 2)
    else
      d = d + ((u - d) / 2) + 1
    end
    r = d
    cnt += 1
  end

  d = 0
  u = 7
  s = nil
  cnt = 7
  3.times do |_i|
    if l[cnt] == 'L'
      u = d + ((u - d) / 2)
    else
      d = d + ((u - d) / 2) + 1
    end
    s = d
    cnt += 1
  end

  seats[r] = [] unless seats.key? r
  seats[r].append s

  result = r * 8 + s
  a.append(result)
end

puts a.sort![a.length - 1]

(a.length - 1).times do |i|
  puts (a[i + 1] - 1).to_s if a[i] != a[i + 1] - 1
end
