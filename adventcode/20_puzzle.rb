require_relative 'parse_input'
require 'pry'

input = File.read('input.txt').split "\n\n"

mat = {}

input.each do |e|
  data = e.split "\n"
  key = data[0].split(' ')[1].gsub(':', '')
  mat[key] = []

  (1..data.length - 1).each do |d|
    mat[key].append data[d].split ''
  end
end

# part one
eql = {}

mat.each do |k, v|
  mat.each do |k1, v1|
    next if k == k1

    res = []

    # check aa
    i = 0
    match = true
    while i < v.length
      match = false unless v[0][i] == v1[0][i]
      i += 1
    end
    res.append ['aa', k1] if match

    # check ab
    i = 0
    match = true
    while i < v.length
      match = false unless v[0][i] == v1[i][v.length - 1]
      i += 1
    end
    res.append ['ab', k1] if match

    # check ac
    i = 0
    match = true
    while i < v.length
      match = false unless v[0][i] == v1[v1.length - 1][i]
      i += 1
    end
    res.append ['ac', k1] if match

    # check ad
    i = 0
    match = true
    while i < v.length
      match = false unless v[0][i] == v1[i][0]
      i += 1
    end
    res.append ['ad', k1] if match

    # check ba
    i = 0
    match = true
    while i < v.length
      match = false unless v[i][v.length - 1] == v1[0][i]
      i += 1
    end
    res.append ['ba', k1] if match

    # check bb
    i = 0
    match = true
    while i < v.length
      match = false unless v[i][v.length - 1] == v1[i][v.length - 1]
      i += 1
    end
    res.append ['bb', k1] if match

    # check bc
    i = 0
    match = true
    while i < v.length
      match = false unless v[i][v.length - 1] == v1[v.length - 1][i]
      i += 1
    end
    res.append ['bc', k1] if match

    # check bd
    i = 0
    match = true
    while i < v.length
      match = false unless v[i][v.length - 1] == v1[i][0]
      i += 1
    end
    res.append ['bd', k1] if match

    # check ca
    i = 0
    match = true
    while i < v[0].length
      match = false unless v[v1.length - 1][i] == v1[0][i]
      i += 1
    end
    res.append ['ca', k1] if match

    # check cb
    i = 0
    match = true
    while i < v[0].length
      match = false unless v[v1.length - 1][i] == v1[i][v1.length - 1]
      i += 1
    end
    res.append ['cb', k1] if match

    # check cc
    i = 0
    match = true
    while i < v[0].length
      match = false unless v[v1.length - 1][i] == v1[v1.length - 1][i]
      i += 1
    end
    res.append ['cc', k1] if match

    # check cd
    i = 0
    match = true
    while i < v[0].length
      match = false unless v[v1.length - 1][i] == v1[i][0]
      i += 1
    end
    res.append ['cd', k1] if match

    # check da
    i = 0
    match = true
    while i < v.length
      match = false unless v[i][0] == v1[0][i]
      i += 1
    end
    res.append ['da', k1] if match

    # check db
    i = 0
    match = true
    while i < v.length
      match = false unless v[i][0] == v1[i][v[0].length - 1]
      i += 1
    end
    res.append ['db', k1] if match

    # check dc
    i = 0
    match = true
    while i < v.length
      match = false unless v[i][0] == v1[v.length - 1][i]
      i += 1
    end
    res.append ['dc', k1] if match

    # check dd
    i = 0
    match = true
    while i < v.length
      match = false unless v[i][0] == v1[i][0]
      i += 1
    end
    res.append ['dd', k1] if match

    # check faa
    i = 0
    fi = v[0].length - 1
    match = true
    while i < v[0].length
      match = false unless v[0][fi] == v1[0][i]
      i += 1
      fi -= 1
    end
    res.append ['faa', k1] if match

    # check fab
    i = 0
    fi = v[0].length - 1
    match = true
    while i < v[0].length
      match = false unless v[0][fi] == v1[i][v[0].length - 1]
      i += 1
      fi -= 1
    end
    res.append ['fab', k1] if match

    # check fac
    i = 0
    fi = v[0].length - 1
    match = true
    while i < v[0].length
      match = false unless v[0][fi] == v1[v1.length - 1][i]
      i += 1
      fi -= 1
    end
    res.append ['fac', k1] if match

    # check fad
    i = 0
    fi = v[0].length - 1
    match = true
    while i < v[0].length
      match = false unless v[0][fi] == v1[i][0]
      i += 1
      fi -= 1
    end
    res.append ['fad', k1] if match

    # check fba
    i = 0
    fi = v.length - 1
    match = true
    while i < v.length
      match = false unless v[fi][v[0].length - 1] == v1[0][i]
      i += 1
      fi -= 1
    end
    res.append ['fba', k1] if match

    # check fbb
    i = 0
    fi = v.length - 1
    match = true
    while i < v.length
      match = false unless v[fi][v[0].length - 1] == v1[i][v[0].length - 1]
      i += 1
      fi -= 1
    end
    res.append ['fbb', k1] if match

    # check fbc
    i = 0
    fi = v.length - 1
    match = true
    while i < v.length
      match = false unless v[fi][v[0].length - 1] == v1[v.length - 1][i]
      i += 1
      fi -= 1
    end
    res.append ['fba', k1] if match

    # check fbd
    i = 0
    fi = v.length - 1
    match = true
    while i < v.length
      match = false unless v[fi][v[0].length - 1] == v1[i][0]
      i += 1
      fi -= 1
    end
    res.append ['fbd', k1] if match

    # check fca
    i = 0
    fi = v[0].length - 1
    match = true
    while i < v[0].length
      match = false unless v[v1.length - 1][fi] == v1[0][i]
      i += 1
      fi -= 1
    end
    res.append ['fca', k1] if match

    # check fcb
    i = 0
    fi = v[0].length - 1
    match = true
    while i < v[0].length
      match = false unless v[v1.length - 1][fi] == v1[i][v[0].length - 1]
      i += 1
      fi -= 1
    end
    res.append ['fcb', k1] if match

    # check fcc
    i = 0
    fi = v[0].length - 1
    match = true
    while i < v[0].length
      match = false unless v[v1.length - 1][fi] == v1[v1.length - 1][i]
      i += 1
      fi -= 1
    end
    res.append ['fcc', k1] if match

    # check fcd
    i = 0
    fi = v[0].length - 1
    match = true
    while i < v[0].length
      match = false unless v[v1.length - 1][fi] == v1[i][0]
      i += 1
      fi -= 1
    end
    res.append ['fcd', k1] if match

    # check fda
    i = 0
    fi = v.length - 1
    match = true
    while i < v.length
      match = false unless v[fi][0] == v1[0][i]
      i += 1
      fi -= 1
    end
    res.append ['fda', k1] if match

    # check fdb
    i = 0
    fi = v.length - 1
    match = true
    while i < v.length
      match = false unless v[fi][0] == v1[i][v[0].length - 1]
      i += 1
      fi -= 1
    end
    res.append ['fdb', k1] if match

    # check fdc
    i = 0
    fi = v.length - 1
    match = true
    while i < v.length
      match = false unless v[fi][0] == v1[v.length - 1][i]
      i += 1
      fi -= 1
    end
    res.append ['fdc', k1] if match

    # check fdd
    i = 0
    fi = v.length - 1
    match = true
    while i < v.length
      match = false unless v[fi][0] == v1[i][0]
      i += 1
      fi -= 1
    end
    res.append ['fdd', k1] if match

    next unless res.length.positive?

    eql[k] ||= []
    eql[k].append res
  end
end

eql = eql.sort_by { |_k, v| v.length }

puts eql[0][0].to_i * eql[1][0].to_i * eql[2][0].to_i * eql[3][0].to_i
