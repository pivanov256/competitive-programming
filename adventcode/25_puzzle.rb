require 'pry'

cp = 15_628_416
dp = 11_161_639

# card loop size key
n = 1
sbj_n = 7
card_loop = 0
until n == cp
  n *= sbj_n
  n = n % 20_201_227
  card_loop += 1
  # puts card_loop
end

# door loop size key
n = 1
sbj_n = 7
door_loop = 0
until n == dp
  n *= sbj_n
  n = n % 20_201_227
  door_loop += 1
end

enk_door = 1
sbj_n = dp
card_loop.times do
  enk_door *= sbj_n
  enk_door = enk_door % 20_201_227
end

enk_card = 1
sbj_n = cp
door_loop.times do
  enk_card *= sbj_n
  enk_card = enk_card % 20_201_227
end

puts enk_card == enk_door ? enk_card : 'error'
