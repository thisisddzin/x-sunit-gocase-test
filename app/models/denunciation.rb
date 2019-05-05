class Denunciation < ApplicationRecord
  belongs_to :survivor
  belongs_to :survivor, foreign_key: "sender_id"
end
