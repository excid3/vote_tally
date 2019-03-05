class Riding < ApplicationRecord
	belongs_to :region
	has_many :polls
	accepts_nested_attributes_for :polls
end
