class SurvivorSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :gender, :abducted
  has_one :location
  has_many :denunciations

  link(:self) { survivor_path(object.id) }
  link(:location) { location_path(object.id) }
end
