class Match < ActiveRecord::Base
  has_many :match_events, dependent: :destroy
end
