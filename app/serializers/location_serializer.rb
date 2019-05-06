class LocationSerializer < ActiveModel::Serializer
  attributes :id, :latitude, :longitude
  belongs_to :survivor

  link(:self) { location_path(object.id) }
end
