require_relative 'parse_input'
require 'pry'

input = read_input

foods = {}
al = {}

input.each do |l|
  cp = []
  l = l.split '('
  l[0].split(' ').each do |f|
    foods[f] ||= 0
    foods[f] += 1
    cp.append f
  end
  next unless l.length > 1

  l[1] = l[1].gsub('contains', '').gsub(')', '')
  l[1].split(',').each do |a|
    al[a.strip] ||= {}
    cp.each do |p|
      al[a.strip][p] ||= 0
      al[a.strip][p] += 1
    end
  end
end

def part_one(al, foods)
  res_al = []
  al.each do |k, _v|
    d = al[k].sort_by { |_key, val| -val }
    e = d[0]
    res_al.append e[0] unless res_al.include? e[0]
    i = 0
    while i < d.length && e[1] == d[i][1]
      res_al.append d[i][0] unless res_al.include? d[i][0]
      i += 1
    end
  end

  res = 0
  foods.each do |k, v|
    res += v unless res_al.include? k
  end
  res
end

def part_two(al)
  ale = {}
  al.each do |k, _v|
    res_al = []
    d = al[k].sort_by { |_key, val| -val }
    e = d[0]
    i = 0
    while i < d.length && e[1] == d[i][1]
      res_al.append d[i][0]
      i += 1
    end
    ale[k] = res_al
  end

  als = ale.sort_by { |_key, val| val.length }

  found = []
  while als.any? { |e| e[1].length > 1 }
    als.each_with_index do |a, i|
      k = a[0]
      al = a[1]
      if al.length == 1
        als[i] = [k, al]
        found.append al[0]
      else
        nal = []
        al.each do |e|
          nal.append e unless found.include? e
        end
        als[i] = [k, nal]
      end
    end
  end

  als = als.sort_by { |e| e[0] }
  als.map! { |e| e[1][0] }

  als
end

puts part_one(al, foods)
puts part_two(al).join(',')
