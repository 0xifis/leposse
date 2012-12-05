class GamesUsers < ActiveRecord::Base
  attr_accessible :game_id, :user_id
end
