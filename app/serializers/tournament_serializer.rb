class TournamentSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :competitors
end
