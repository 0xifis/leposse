class Sport < ActiveRecord::Base
  attr_accessible :name
  has_many :games
  has_and_belongs_to_many :venues
end
