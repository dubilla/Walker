class CompetitorSerializer < ActiveModel::Serializer
  attributes :id, :name, :score
  belongs_to :tournaments
end
