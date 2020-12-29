require 'pry'

input = File.read('input.txt').split "\n\n"

keys = %w[byr ecl eyr hcl hgt iyr pid]
rinput = []
r_one = 0
r_two = 0

input.each do |l|
  l = l.split "\n"
  l.each do |lin|
    lin.split(' ').each { |e| rinput.append e }
  end

  tkeys = []

  rinput.each do |ri|
    rik, val = ri.split ':'
    tkeys.append rik unless rik == 'cid'
  end

  check = true
  keys.each do |e|
    check = false unless tkeys.include? e
  end

  if check
    check_rules = true
    rinput.each do |ri|
      rik, val = ri.split ':'
      case rik
      when 'byr'
        check_rules = false unless val.length == 4
        check_rules = false if val.to_i < 1920 || val.to_i > 2002
      when 'iyr'
        check_rules = false unless val.length == 4
        check_rules = false if val.to_i < 2010 || val.to_i > 2020
      when 'eyr'
        check_rules = false unless val.length == 4
        check_rules = false if val.to_i < 2020 || val.to_i > 2030
      when 'hgt'
        m = val.match(/^(\d+)(cm|in)$/)
        if m
          if m[2] == 'cm'
            check_rules = false if m[1].to_i < 150 || m[1].to_i > 193
          elsif m[2] == 'in'
            check_rules = false if m[1].to_i < 59 || m[1].to_i > 76
          end
        else
          check_rules = false
        end
      when 'hcl'
        m = val.match(/^#([0-9]|[a-f]){6}$/)
        check_rules = false unless m
      when 'ecl'
        ecl_arr = %w[amb blu brn gry grn hzl oth]
        check_rules = false unless ecl_arr.include? val
      when 'pid'
        m = val.match(/^[0-9]{9}$/)
        check_rules = false unless m
      end
    end

    r_two += 1 if check_rules
    r_one += 1
  end

  tkeys = []
  rinput = []
end

puts r_one
puts r_two
