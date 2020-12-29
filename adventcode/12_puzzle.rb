require_relative 'parse_input'
require 'pry'

input = read_input

d = { 'N' => 0, 'S' => 0, 'E' => 0, 'W' => 0 }

ldir = 'E'
pos = %w[N E S W]
v = { 90 => 1, 180 => 2, 270 => 3 }
# S => N
def cal(dir1, dir2, val, d)
  c = d[dir2] - val
  # d[dir1] += val
  if c.positive?
    d[dir2] = c
    d[dir1] = 0
  else
    d[dir2] = 0
    d[dir1] += c.abs
  end
end

input.each do |l|
  dir = l[0]
  value = l[1..].to_i

  if dir == 'F'
    case ldir
    when 'E'
      cal('E', 'W', value, d)
    when 'W'
      cal('W', 'E', value, d)
    when 'N'
      cal('N', 'S', value, d)
    when 'S'
      cal('S', 'N', value, d)
    end
  end

  if ldir == 'E'
    if dir == 'E'
      cal('E', 'W', value, d)
    elsif dir == 'N'
      cal('N', 'S', value, d)
    elsif dir == 'S'
      cal('S', 'N', value, d)
    elsif dir == 'W'
      cal('W', 'E', value, d)
    end
  end
  if ldir == 'W'
    if dir == 'W'
      cal('W', 'E', value, d)
    elsif dir == 'N'
      cal('N', 'S', value, d)
    elsif dir == 'S'
      cal('S', 'N', value, d)
    elsif dir == 'E'
      cal('E', 'W', value, d)
    end
  end
  if ldir == 'N'
    if dir == 'N'
      cal('N', 'S', value, d)
    elsif dir == 'E'
      cal('E', 'W', value, d)
    elsif dir == 'W'
      cal('W', 'E', value, d)
    elsif dir == 'S'
      cal('S', 'N', value, d)
    end
  end
  if ldir == 'S'
    if dir == 'S'
      cal('S', 'N', value, d)
    elsif dir == 'E'
      cal('E', 'W', value, d)
    elsif dir == 'W'
      cal('W', 'E', value, d)
    elsif dir == 'N'
      cal('N', 'S', value, d)
    end
  end

  if dir == 'R'
    idx = pos.index(ldir) # 3 + 3 = 6
    ldir = pos[(idx + v[value]) % 4]
  end

  if dir == 'L'
    idx = pos.index(ldir) # 1 - 3 = -2
    ldir = pos[idx - v[value]]
  end
end
# part one
puts d
puts d.values.inject(0) { |sum, a| sum + a }
