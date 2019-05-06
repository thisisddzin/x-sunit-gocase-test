class SurvivorSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :gender, :abducted

  has_one :location do
    link(:related) { survivor_location_url(object.id) }
  end

  has_many :denunciations do
    link(:related) { survivor_denunciations_url(object.id) }
  end

  link(:self) { survivor_url(object.id) }
  
end
