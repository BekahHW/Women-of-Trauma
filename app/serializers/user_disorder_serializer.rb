class UserDisorderSerializer < ActiveModel::Serializer
  attributes :id, :narrative
  # belongs_to :disorders
  # belongs_to :users

  ActiveModel::Serializer.config.key_transform = :unaltered

end
