require_relative 'parse_input'
require 'pry'

input = read_input
m = []
coords = []
input.each { |l| m.append l.strip.split '' }
im = m.length
jm = m[0].length

def updiagl(i, j, m)
  while i >= 0 && j >= 0 && m[i][j] == '.'
    i -= 1
    j -= 1
  end
  if i < 0 || j < 0
    true
  else
    m[i][j] == 'L' || m[i][j] == '.'
  end
end

def up(i, j, m)
  i -= 1 while i >= 0 && m[i][j] == '.'
  if i < 0
    true
  else
    m[i][j] == 'L' || m[i][j] == '.'
  end
end

def updiagr(i, j, m, jm)
  while i >= 0 && j < jm && m[i][j] == '.'
    i -= 1
    j += 1
  end
  if i < 0 || j >= jm
    true
  else
    m[i][j] == 'L' || m[i][j] == '.'
  end
end

def right(i, j, m, jm)
  j += 1 while j < jm && m[i][j] == '.'
  if j >= jm
    true
  else
    m[i][j] == 'L' || m[i][j] == '.'
  end
end

def downdiagr(i, j, m, im, jm)
  while i < im && j < jm && m[i][j] == '.'
    i += 1
    j += 1
  end
  if i >= im || j >= jm
    true
  else
    m[i][j] == 'L' || m[i][j] == '.'
  end
end

def down(i, j, m, im)
  i += 1 while i < im && m[i][j] == '.'
  if i >= im
    true
  else
    m[i][j] == 'L' || m[i][j] == '.'
  end
end

def downdiagl(i, j, m, im)
  while i < im && j >= 0 && m[i][j] == '.'
    i += 1
    j -= 1
  end
  if i >= im || j < 0
    true
  else
    m[i][j] == 'L' || m[i][j] == '.'
  end
end

def left(i, j, m)
  j -= 1 while j >= 0 && m[i][j] == '.'
  if j < 0
    true
  else
    m[i][j] == 'L' || m[i][j] == '.'
  end
end

def updiagl1(i, j, m)
  r = false
  while i >= 0 && j >= 0
    if m[i][j] == '#'
      r = true
      break
    end
    break if m[i][j] == 'L'

    i -= 1
    j -= 1
  end
  r
end

def up1(i, j, m)
  r = false
  while i >= 0
    if m[i][j] == '#'
      r = true
      break
    end
    break if m[i][j] == 'L'

    i -= 1
  end
  r
end

def updiagr1(i, j, m, jm)
  r = false
  while i >= 0 && j < jm
    if m[i][j] == '#'
      r = true
      break
    end
    break if m[i][j] == 'L'

    i -= 1
    j += 1
  end
  r
end

def right1(i, j, m, jm)
  r = false
  while j < jm
    if m[i][j] == '#'
      r = true
      break
    end
    break if m[i][j] == 'L'

    j += 1
  end
  r
end

def downdiagr1(i, j, m, im, jm)
  r = false
  while i < im && j < jm
    if m[i][j] == '#'
      r = true
      break
    end
    break if m[i][j] == 'L'

    i += 1
    j += 1
  end
  r
end

def down1(i, j, m, im)
  r = false
  while i < im
    if m[i][j] == '#'
      r = true
      break
    end
    break if m[i][j] == 'L'

    i += 1
  end
  r
end

def downdiagl1(i, j, m, im)
  r = false
  while i < im && j >= 0
    if m[i][j] == '#'
      r = true
      break
    end
    break if m[i][j] == 'L'

    i += 1
    j -= 1
  end
  r
end

def left1(i, j, m)
  r = false
  while j >= 0
    if m[i][j] == '#'
      r = true
      break
    end
    break if m[i][j] == 'L'

    j -= 1
  end
  r
end

101.times do |_t|
  i = 0
  while i < m.length
    j = 0
    while j < m[i].length
      # part one
      # unless m[i][j] == '.'
      #   if m[i][j] == 'L'
      #     cnt = 0
      #     eq = 8
      #     cnt += 1 if i - 1 >= 0 && j - 1 >= 0 && (m[i - 1][j - 1] == 'L' || m[i - 1][j - 1] == '.')
      #     cnt += 1 if i - 1 >= 0 && (m[i - 1][j] == 'L' || m[i - 1][j] == '.')
      #     cnt += 1 if i - 1 >= 0 && j + 1 < jm && (m[i - 1][j + 1] == 'L' || m[i - 1][j + 1] == '.')
      #     cnt += 1 if j + 1 < jm && (m[i][j + 1] == 'L' || m[i][j + 1] == '.')
      #     cnt += 1 if i + 1 < im && j + 1 < jm && (m[i + 1][j + 1] == 'L' || m[i + 1][j + 1] == '.')
      #     cnt += 1 if i + 1 < im && (m[i + 1][j] == 'L' || m[i + 1][j] == '.')
      #     cnt += 1 if i + 1 < im && j - 1 >= 0 && (m[i + 1][j - 1] == 'L' || m[i + 1][j - 1] == '.')
      #     cnt += 1 if j - 1 >= 0 && (m[i][j - 1] == 'L' || m[i][j - 1] == '.')

      #     eq -= 1 unless i - 1 >= 0 && j - 1 >= 0
      #     eq -= 1 unless i - 1 >= 0
      #     eq -= 1 unless i - 1 >= 0 && j + 1 < jm
      #     eq -= 1 unless j + 1 < jm
      #     eq -= 1 unless i + 1 < im && j + 1 < jm
      #     eq -= 1 unless i + 1 < im
      #     eq -= 1 unless i + 1 < im && j - 1 >= 0
      #     eq -= 1 unless j - 1 >= 0

      #     if cnt == eq
      #       coords.append([i, j, '#'])
      #     else
      #       coords.append([i, j, 'L'])
      #     end
      #   end

      #   if m[i][j] == '#'
      #     cnt = 0
      #     cnt += 1 if i - 1 >= 0 && j - 1 >= 0 && m[i - 1][j - 1] == '#'
      #     cnt += 1 if i - 1 >= 0 && m[i - 1][j] == '#'
      #     cnt += 1 if i - 1 >= 0 && j + 1 < jm && m[i - 1][j + 1] == '#'
      #     cnt += 1 if j + 1 < jm && m[i][j + 1] == '#'
      #     cnt += 1 if i + 1 < im && j + 1 < jm && m[i + 1][j + 1] == '#'
      #     cnt += 1 if i + 1 < im && m[i + 1][j] == '#'
      #     cnt += 1 if i + 1 < im && j - 1 >= 0 && m[i + 1][j - 1] == '#'
      #     cnt += 1 if j - 1 >= 0 && m[i][j - 1] == '#'

      #     if cnt >= 5
      #       coords.append([i, j, 'L'])
      #     else
      #       coords.append([i, j, '#'])
      #     end
      #   end
      # end
      # part two
      unless m[i][j] == '.'
        if m[i][j] == 'L'
          cnt = 0
          eq = 8
          cnt += 1 if updiagl(i - 1, j - 1, m)
          cnt += 1 if up(i - 1, j, m)
          cnt += 1 if updiagr(i - 1, j + 1, m, jm)
          cnt += 1 if right(i, j + 1, m, jm)
          cnt += 1 if downdiagr(i + 1, j + 1, m, im, jm)
          cnt += 1 if down(i + 1, j, m, im)
          cnt += 1 if downdiagl(i + 1, j - 1, m, im)
          cnt += 1 if left(i, j - 1, m)

          if cnt == eq
            coords.append([i, j, '#'])
          else
            coords.append([i, j, 'L'])
          end
        end

        if m[i][j] == '#'
          cnt = 0
          cnt += 1 if updiagl1(i - 1, j - 1, m)
          cnt += 1 if up1(i - 1, j, m)
          cnt += 1 if updiagr1(i - 1, j + 1, m, jm)
          cnt += 1 if right1(i, j + 1, m, jm)
          cnt += 1 if downdiagr1(i + 1, j + 1, m, im, jm)
          cnt += 1 if down1(i + 1, j, m, im)
          cnt += 1 if downdiagl1(i + 1, j - 1, m, im)
          cnt += 1 if left1(i, j - 1, m)

          if cnt >= 5
            coords.append([i, j, 'L'])
          else
            coords.append([i, j, '#'])
          end
        end
      end
      j += 1
    end
    i += 1
  end

  coords.each do |c|
    m[c[0]][c[1]] = c[2]
  end
end

i = 0
r = 0
while i < m.length
  j = 0
  while j < m[i].length
    r += 1 if m[i][j] == '#'
    j += 1
  end
  i += 1
end
puts r
