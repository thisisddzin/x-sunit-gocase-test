class SurvivorSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :gender, :abducted
  has_one :location
  has_many :denunciations
end
