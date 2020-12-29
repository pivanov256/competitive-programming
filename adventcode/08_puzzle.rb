require_relative 'parse_input'
require 'pry'

input = read_input
accum = 0
i = 0
l = []

def check(j, input, acc)
  lj = []
  has_loop = false
  while j < input.length
    instr, v = input[j].split ' '
    case instr
    when 'acc'
      acc += v.to_i
    when 'jmp'
      j += v.to_i

      if lj.include? j
        has_loop = true
        break
      end

      lj.append(j)
      next
    end
    j += 1
    lj.append(j)
  end
  puts "Part Two: #{acc}" unless has_loop
end

while i < input.length
  instr, v = input[i].split ' '
  case instr
  when 'nop'
    input[i] = 'jump ' << v
    check i, input, accum

    input[i] = 'nop ' << v
  when 'acc'
    accum += v.to_i
  when 'jmp'
    input[i] = 'nop ' << v
    check i, input, accum

    input[i] = 'jump ' << v
    i += v.to_i
    break if l.include? i

    l.append(i)
    next
  end

  i += 1
  l.append(i)
end

puts "Part One: #{accum}"
