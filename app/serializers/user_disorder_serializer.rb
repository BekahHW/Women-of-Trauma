class UserDisorderSerializer < ActiveModel::Serializer
  attributes :id, :narrative
  belongs_to :disorders
  belongs_to :user
end
