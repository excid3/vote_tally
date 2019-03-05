class Poll < ApplicationRecord
  belongs_to :riding
  
  counter_culture :riding, column_name: 'liberal_vote_count', delta_column: 'candidate_one'
  counter_culture :riding, column_name: 'conservative_vote_count', delta_column: 'candidate_two'
  counter_culture :riding, column_name: 'ndp_vote_count', delta_column: 'candidate_three'
  counter_culture :riding, column_name: 'green_vote_count', delta_column: 'candidate_four'
  counter_culture :riding, column_name: 'peoples_vote_count', delta_column: 'candidate_one'
end
