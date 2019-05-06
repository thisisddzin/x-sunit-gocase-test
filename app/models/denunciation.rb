class Denunciation < ApplicationRecord
  belongs_to :survivor
  belongs_to :sender, class_name: 'Survivor', foreign_key: "sender_id"
end
