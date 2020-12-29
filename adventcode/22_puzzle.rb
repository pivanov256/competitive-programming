require_relative 'parse_input'
require 'pry'

input = File.read('input.txt').split "\n\n"

p1 = []
p2 = []

input[0].split("\n").each do |l|
  next if l == 'Player 1:'

  p1.append(l.to_i)
end

input[1].split("\n").each do |l|
  next if l == 'Player 2:'

  p2.append(l.to_i)
end

def rec(p1, p2)
  o1 = []
  o2 = []
  while !p1.empty? && !p2.empty?
    resc = nil
    r1 = p1.inject(' ') { |a, b| a + b.to_s }
    r2 = p2.inject(' ') { |a, b| a + b.to_s }
    if o1.include?(r1) || o2.include?(r2)
      p1 = [0]
      break
    end
    o1.append r1
    o2.append r2
    c1 = p1.shift
    c2 = p2.shift
    if c1 <= p1.length && c2 <= p2.length
      p1c = []
      i = 0
      while i < c1
        p1c.append p1[i]
        i += 1
      end

      p2c = []
      i = 0
      while i < c2
        p2c.append p2[i]
        i += 1
      end

      resc = rec(p1c, p2c)
    end

    if resc.nil?
      if c1 > c2
        p1.append c1
        p1.append c2
      elsif c2 > c1
        p2.append c2
        p2.append c1
      end
    elsif resc == 'p1'
      p1.append c1
      p1.append c2
    else
      p2.append c2
      p2.append c1
    end
  end

  if p1.empty?
    'p2'
  else
    'p1'
  end
end

def part_one(p1, p2)
  while !p1.empty? && !p2.empty?
    c1 = p1.shift
    c2 = p2.shift
    if c1 > c2
      p1.append c1
      p1.append c2
    elsif c2 > c1
      p2.append c2
      p2.append c1
    end
  end

  if p1.empty?
    p2.reverse
  else
    p1.reverse
  end
end

def part_two(p1, p2)
  if rec(p1, p2) == 'p1'
    p1.reverse
  else
    p2.reverse
  end
end

sum = 0
# part_one(p1, p2).each_with_index do |e, i|
#   sum += e * (i + 1)
# end

part_two(p1, p2).each_with_index do |e, i|
  sum += e * (i + 1)
end

puts sum
