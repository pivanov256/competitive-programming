require_relative 'parse_input'
require 'pry'

input = read_input

def cb(mb, b)
  mb.to_i | b.to_i
end

def find_comb(s, comb)
  if s.include? 'X'
    tmp = s.split ''
    s.split('').each_with_index do |v, i|
      next unless v == 'X'

      tmp[i] = '1'
      find_comb tmp.inject('') { |a, b| a + b }, comb
      tmp[i] = '0'
      find_comb tmp.inject('') { |a, b| a + b }, comb
      break
    end
  else
    comb.append(s)
  end
end

def part_one(mask, num, pos, res)
  bitn = num.to_s(2).rjust(mask.length, '0').split ''
  snum = ''
  bitn.each_with_index do |b, i|
    snum += if mask[i] == 'X'
              b
            else
              mask[i]
            end
  end
  res[pos] = snum.to_i(2)
end

def part_two(mask, num, pos, res)
  comb = []
  bitn = pos.to_s(2).rjust(mask.length, '0').split ''
  snum = ''
  bitn.each_with_index do |b, i|
    snum += if mask[i] == 'X'
              'X'
            else
              cb(mask[i], b).to_s
            end
  end
  find_comb snum, comb

  comb.each do |c|
    res[c.to_i(2)] = num
  end
end

mask = nil
res_one = {}
res_two = {}
input.each do |l|
  if l.include? 'mask'
    mask = l.split('=')[1].strip.split ''
  else
    data = l.split('=')
    num = data[1].strip.to_i
    m = data[0].match(/\d+/)
    pos = m[0].to_i

    part_one mask, num, pos, res_one
    part_two mask, num, pos, res_two
  end
end

puts res_one.values.inject(0) { |a, b| a + b }
puts res_two.values.inject(0) { |a, b| a + b }
