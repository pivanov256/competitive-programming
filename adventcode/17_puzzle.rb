require_relative 'parse_input'
require 'pry'

input = read_input
tim = 20
m = []

# part one is same as part two but without the 4th dimension

tim.times do |i|
  m.append []
  tim.times do |j|
    m[i].append []
    tim.times do |k|
      m[i][j].append []
      tim.times do
        m[i][j][k].append '.'
      end
    end
  end
end
off = 7
input.each_with_index do |l, i|
  l = l.strip.split ''
  l.each_with_index do |l1, j|
    m[tim / 2][tim / 2][i + off][j + off] = l1
  end
end

def check(w, z, x, y, m, coords)
  ww = w - 1
  zz = z - 1
  xx = x - 1
  yy = y - 1
  a = 0
  3.times do |q|
    3.times do |i|
      3.times do |j|
        3.times do |k|
          next if ww + q == w && zz + i == z && xx + j == x && yy + k == y

          a += 1 if m[ww + q][zz + i][xx + j][yy + k] == '#'
        end
      end
    end
  end
  val = m[w][z][x][y]

  if val == '#'
    coords.append [w, z, x, y, '.'] unless [2, 3].include?(a)
  elsif val == '.'
    coords.append [w, z, x, y, '#'] if a == 3
  end
end

6.times do
  coords = []
  tim.times do |q|
    tim.times do |i|
      tim.times do |j|
        tim.times do |k|
          if q > 0 && q < tim - 1 && i > 0 && i < tim - 1 && j > 0 && j < tim - 1 && k > 0 && k < tim - 1
            check(q, i, j, k, m, coords)
          end
        end
      end
    end
  end

  coords.each do |c|
    m[c[0]][c[1]][c[2]][c[3]] = c[4]
  end
  coords = []
end

r = 0
tim.times do |q|
  tim.times do |i|
    tim.times do |j|
      tim.times do |k|
        r += 1 if m[q][i][j][k] == '#'
      end
    end
  end
end
puts r
