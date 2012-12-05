class Game < ActiveRecord::Base
  attr_accessible :date, :details, :end_time, :host_id, :maxpax, :sport_id, :start_time, :venue_id
  belongs_to :venue
  belongs_to :sport
  has_and_belongs_to_many :users
end
