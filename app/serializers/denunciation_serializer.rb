class DenunciationSerializer < ActiveModel::Serializer
  attributes :id, :sender_id, :survivor_id
  belongs_to :survivor
  belongs_to :sender, class_name: 'Survivor', foreign_key: "sender_id"

end
