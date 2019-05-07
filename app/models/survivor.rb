class Survivor < ApplicationRecord
    has_one :location 
    has_many :denunciations
    accepts_nested_attributes_for :location, update_only: true

    validates :name, length: { in: 2..50 }
    validates :age, numericality: { only_integer: true }
    validates :gender, presence: true
end
