class LocationSerializer < ActiveModel::Serializer
  attributes :id, :latitude, :longitude
  
  belongs_to :survivor do
    link(:related) { location_survivor_url(object.id) }
  end

  link(:self) { location_url(object.id) }
  
end
