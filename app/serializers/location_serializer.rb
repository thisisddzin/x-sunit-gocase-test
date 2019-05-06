class LocationSerializer < ActiveModel::Serializer
  attributes :id, :latitude, :longitude
  belongs_to :survivor

  link(:self) { location_url(object.id) }
  link(:survivor) { survivor_url(object.id) }
end
