class Tournament < ActiveRecord::Base
  has_many :competitors
end
