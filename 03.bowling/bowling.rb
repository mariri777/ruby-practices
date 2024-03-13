#!/usr/bin/env ruby
# frozen_string_literal: true

scores = []
ARGV[0].split(',').each do |s|
  if s == 'X'
    scores << 10
  else
    scores << s.to_i
  end
end

frame_index = 1
throw_index = 1
total_score = 0

scores.each.with_index(0) do |score, score_index|
  if frame_index == 10
    total_score += score
  else
    strike = throw_index == 1 && score == 10
    spare = throw_index == 2 && scores[score_index - 1] + score == 10
    next_frame = strike || throw_index == 2

    total_score += score
    total_score +=
      if strike
        scores[score_index + 1] + scores[score_index + 2]
      elsif spare
        scores[score_index + 1]
      else
        0
      end
  end

  if next_frame
    frame_index += 1
    throw_index = 1
  else
    throw_index += 1
  end
end

p total_score
