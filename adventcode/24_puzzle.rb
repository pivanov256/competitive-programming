require_relative 'parse_input'
require 'pry'

input = read_input

paths = []
pt = {}

input.each_with_index do |l, idx|
  l = l.strip.split ''
  paths.append []
  i = 0
  while i < l.length
    case l[i]
    when 'e'
      paths[idx].append 'e'
    when 's'
      paths[idx].append 's' << l[i + 1]
      i += 1
    when 'w'
      paths[idx].append 'w'
    when 'n'
      paths[idx].append 'n' << l[i + 1]
      i += 1
    end
    i += 1
  end
end

def calc_result(pt)
  r = 0
  pt.each do |_k, v|
    r += 1 if v == 'b'
  end
  r
end

# part one
paths.each do |path|
  x = 0
  y = 0
  path.each do |p|
    case p
    when 'e'
      x += 2
    when 'se'
      x += 1
      y -= 1
    when 'sw'
      x -= 1
      y -= 1
    when 'w'
      x -= 2
    when 'nw'
      x -= 1
      y += 1
    when 'ne'
      x += 1
      y += 1
    end
  end

  pt[[x, y]] = if pt.key? [x, y]
                 if pt[[x, y]] == 'b'
                   'w'
                 else
                   'b'
                 end
               else
                 'b'
               end
end

puts "Res: #{calc_result pt}"

# part two
min = -120
max = 120

i = min
while i < max
  j = min
  while j < max
    k0 = [i, j]
    k1 = [i, j + 2]
    k2 = [i + 1, j + 1]
    k3 = [i + 1, j - 1]
    k4 = [i, j - 2]
    k5 = [i - 1, j - 1]
    k6 = [i - 1, j + 1]
    pt[k0] = 'w' unless pt.key? k0
    pt[k1] = 'w' unless pt.key? k1
    pt[k2] = 'w' unless pt.key? k2
    pt[k3] = 'w' unless pt.key? k3
    pt[k4] = 'w' unless pt.key? k4
    pt[k5] = 'w' unless pt.key? k5
    pt[k6] = 'w' unless pt.key? k6

    j += 2
  end
  i += 2
end

tim = 100
tim.times do |ti|
  cc = []
  pt.each do |k, v|
    x = k[0]
    y = k[1]

    cnt = 0
    cnt += 1 if pt[[x + 2, y]] == 'b'
    cnt += 1 if pt[[x + 1, y + 1]] == 'b'
    cnt += 1 if pt[[x - 1, y + 1]] == 'b'
    cnt += 1 if pt[[x - 2, y]] == 'b'
    cnt += 1 if pt[[x - 1, y - 1]] == 'b'
    cnt += 1 if pt[[x + 1, y - 1]] == 'b'

    if v == 'b'
      cc.append [x, y, 'w'] if cnt.zero? || cnt > 2
    elsif v == 'w'
      cc.append [x, y, 'b'] if cnt == 2

    end
  end

  cc.each do |c|
    pt[[c[0], c[1]]] = c[2]
  end
end

puts "Res: #{calc_result pt}"
