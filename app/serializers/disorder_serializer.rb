class DisorderSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :user_disorders
  has_many :user_disorders
  has_many :users, through: :user_disorders

  def user
    {user_id: self.object.user.id,
     user_name: self.object.user.name}
  end

  # def user_disorder
  #   {user_disorder_id: self.object.user_disorder.id,
  #    user_disorder_name: self.object.user_disorder.narrative}
  # end
end
