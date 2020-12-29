require 'pry'

el = [5, 6, 2, 8, 9, 3, 1, 4, 7]

def part_one(el)
  iter = 100
  cur = el[0]
  iter.times do |_time|
    ell = el.length
    cur_i = el.index(cur)
    cur_ic = cur_i
    cur_i += 1
    took_el = []
    3.times do
      cur_i = 0 if cur_i >= ell
      took_el.append el[cur_i]
      el[cur_i] = nil
      cur_i += 1
    end

    el.delete(nil)

    dest = cur - 1
    dest -= 1 while took_el.include? dest
    dest_i = el.index(dest)
    dest = el.max if dest_i.nil?
    dest_i = el.index(dest)
    dest_i += 1

    took_el.each do |e|
      dest_i = 0 if dest_i >= ell
      el.insert(dest_i, e)
      dest_i += 1
    end

    cur_i2 = el.index(cur)
    if cur_ic != cur_i2
      tmp = []
      el.each do |e|
        tmp.append e
      end
      m = cur_i2 - cur_ic
      el.each_with_index do |e, i|
        tmp.insert(i - m, e)
      end

      el = []
      i = 0
      while i < ell
        el.append tmp[i]
        i += 1
      end
    end

    cur_i = el.index(cur)
    cur_i += 1
    cur_i = 0 if cur_i >= ell

    cur = el[cur_i]
  end

  cur_i = el.index(1) + 1
  res = []
  (el.length - 1).times do
    cur_i = 0 if cur_i >= el.length
    res.append el[cur_i]
    cur_i += 1
  end

  res
end

puts part_one(el).join('')
