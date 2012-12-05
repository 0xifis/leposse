class Venue < ActiveRecord::Base
  attr_accessible :locality, :name, :opening_hours, :game_id
  has_many :games
  has_and_belongs_to_many :sports
end
