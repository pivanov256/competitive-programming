require_relative 'parse_input'
require 'pry'

input = read_input

ranges = []
d = {}

cnt = 0
while input[cnt] != "\n"
  t = input[cnt].strip.split(':')[0]
  l = input[cnt].scan(/\d+/).map(&:to_i)

  ranges.append(l[0]..l[1]).append(l[2]..l[3])
  d[t] = [l[0]..l[1], l[2]..l[3]]

  cnt += 1
end

cnt += 2
mt = input[cnt].strip.split(',').map(&:to_i)

ot = []
cnt += 3
while cnt < input.length
  ot.append(input[cnt].strip.split(',').map(&:to_i))
  cnt += 1
end

ot.append(mt)

# part one
res = []

ot.each do |t|
  t.each_with_index do |i, idx|
    out = true
    ranges.each do |r|
      out = false if r.include? i
    end
    if out
      res.append(i)
      t[idx] = -1
    end
  end
end

puts res.inject(0) { |a, b| a + b }

# part two
dp = {}
d.each do |k, v|
  i = 0
  while i < ot[0].length
    j = 0
    add = true
    while j < ot.length
      if ot[j][i] != -1
        add = false unless v[0].include?(ot[j][i]) || v[1].include?(ot[j][i])
      end
      j += 1
    end
    if add
      dp[k] = [] unless dp.key? k
      dp[k].append(i)
      add = false
    end
    i += 1
  end
end
res = dp.sort_by { |_key, value| value.length }

added = []
dr = {}
res.each do |i|
  i[1].each do |c|
    unless added.include? c
      added.append(c)
      dr[i[0]] = c
    end
  end
end

result = 1
dr.each do |k, v|
  result *= mt[v] if k.include? 'departure'
end

puts result


# class: 0-1 or 4-19 # 2
# row: 0-5 or 8-19 # 1
# seat: 0-13 or 16-19 # 3

# your ticket:
# 11,12,13

# nearby tickets:
#  3, 9,18
# 15, 1, 5
#  5,14, 9

# class: 1-3 or 5-7
# row: 6-11 or 33-44
# seat: 13-40 or 45-50

# your ticket:
# 7,1,14

# nearby tickets:
# 7,3,47
# 40,4,50
# 55,2,20
# 38,6,12
