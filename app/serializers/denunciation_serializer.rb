class DenunciationSerializer < ActiveModel::Serializer
  attributes :id, :sender_id, :survivor_id
  
  belongs_to :survivor do 
    link(:related) { denunciation_survivor_url(object.id) }
  end
  
  belongs_to :sender, class_name: 'Survivor', foreign_key: "sender_id"

end
