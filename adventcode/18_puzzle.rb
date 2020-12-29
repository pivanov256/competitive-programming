require_relative 'parse_input'
require 'pry'

input = read_input

def calc(i, l)
  mul = []
  if l[i] == '('
    ran = calc(i + 1, l)
    n = ran[0]
    i = ran[1] + 1
  else
    n = l[i].to_i
    i += 1
  end

  while l[i] != ')'
    ran = [l[i + 1].to_i, i]
    s = l[i]
    ran = calc(i + 2, l) if l[i + 1] == '('
    i = ran[1]

    if s == '+'
      n += ran[0]
    elsif s == '*'
      # part one
      # n *= ran[0]
      # end part one

      # part two
      mul.append(n)
      n = ran[0]
      # end part two
    end
    i += 1
  end
  mul.append(n)
  m = mul.inject(1) { |am, b| am * b }
  [m, i]
end

res = 0
input.each do |l|
  l = l.strip.split('')
  l.delete(' ')
  mul = []

  if l[0] == '('
    ran = calc(1, l)
    r = ran[0]
    i = ran[1]
  else
    r = l[0].to_i
    i = 1
  end

  while i < l.length
    ran = [l[i + 1].to_i, i]
    ran = calc(i + 2, l) if l[i + 1] == '('
    if l[i] == '+'
      r += ran[0]
    elsif l[i] == '*'
      # part one
      # r *= ran[0]
      # end part one

      # part two
      mul.append(r)
      r = ran[0]
      # end part two
    end

    break if ran[1] >= l.length - 1

    i = ran[1] + 1
  end
  mul.append(r)
  m = mul.inject(1) { |am, b| am * b }
  res += m
end

puts res
