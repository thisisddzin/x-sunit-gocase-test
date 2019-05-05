class Survivor < ApplicationRecord
    has_one :location 
    accepts_nested_attributes_for :location, update_only: true
end
