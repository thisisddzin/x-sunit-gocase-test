class Survivor < ApplicationRecord
    has_one :location 
    has_many :denunciations
    accepts_nested_attributes_for :location, update_only: true
end
