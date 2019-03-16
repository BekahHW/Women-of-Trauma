class UserDisorderSerializer < ActiveModel::Serializer
  attributes :id, :narrative
  belongs_to :disorders

  # ActiveModel::Serializer.config.key_transform = :unaltered

end
