require_relative 'parse_input'
require 'pry'

input = read_input

time = input[0].strip.to_i
values = input[1].split(',')

def first_part(time, values)
  diff = (2**(0.size * 8 - 2) - 1)
  r = 0

  values.each do |v|
    next if v == 'x'

    v = v.strip.to_i
    t = (time / v) + 1
    d = t * v - time
    if diff > d
      diff = d
      r = v
    end
  end

  r * diff
end

def second_part(values)
  step = 1
  curr_num = values[0].strip.to_i

  values.each_with_index do |v, i|
    next if v == 'x'

    v = v.strip.to_i
    curr_num += step while (curr_num + i) % v != 0

    step *= v
  end

  curr_num
end

puts first_part time, values
puts second_part values
