class LocationSerializer < ActiveModel::Serializer
  attributes :id, :latitude, :longitude
  belongs_to :survivor
end
