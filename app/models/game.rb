class Game < ActiveRecord::Base
  attr_accessible :date, :details, :end_time, :host_id, :maxpax, :sport_id, :start_time, :venue_id, :title
  belongs_to :venue
  belongs_to :sport
  has_and_belongs_to_many :users, uniq: true

  validates :date, :end_time, :host_id, :maxpax, :sport_id, :start_time, :venue_id, :title, presence: true
  validate :valid_time

  include PgSearch
  pg_search_scope :search, :against => [:title, :sport, :host_id, :venue, :details]
  pg_search_scope :with_trigram, :against => [:title, :sport, :host_id, :venue, :details], :using => :trigram
  pg_search_scope :with_dmetaphone, :against => [:title, :sport, :host_id, :venue, :details], :using => :dmetaphone
  pg_search_scope :with_ignoring_accents, :against => [:title, :sport, :host_id, :venue, :details], :ignoring => :accents

    def valid_time
      if start_time >= end_time
        self.errors.add :start_time, ' has to be before end time'
      end
    end

end
