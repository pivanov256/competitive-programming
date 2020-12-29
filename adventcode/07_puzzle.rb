require_relative 'parse_input'
require 'pry'

input = read_input
g = {}

def bfs(node, g)
  queue = []
  queue.push(node)
  until queue.empty?
    n = queue.shift
    return true if n == 'shiny gold'

    g[n].each do |child|
      queue.push(child.keys[0])
    end
  end
  false
end

def cnt(node, g)
  num = 1
  return num if g[node].empty?

  g[node].each do |n|
    num += cnt(n.keys[0], g) * n[n.keys[0]]
  end
  num
end

input.each do |l|
  l.gsub! 'bags', ''
  l.gsub! 'bag', ''
  l.gsub! '.', ''
  l = l.split 'contain'

  name = l[0].strip
  g[name] = [] unless g.key? name
  next if l[1].strip == 'no other'

  bags = []
  l[1].split(',').each do |k|
    m = k.strip.match(/^(\d+)\s+(.*)$/)
    bags.append({ m[2] => m[1].to_i })
  end

  bags.each { |b| g[name].append(b) }
end

# part one
result = 0
g.each do |k, _v|
  result += 1 if bfs(k, g) && k != 'shiny gold'
end
puts result

#part two
puts cnt('shiny gold', g) - 1
