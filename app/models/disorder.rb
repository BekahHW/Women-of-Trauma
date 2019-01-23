class Disorder < ApplicationRecord
  has_many :user_disorders
  has_many :user_disorder_treatments, through: :user_disorders
  has_many :users, through: :user_disorders
  has_many :treatments, through: :user_disorder_treatments


  accepts_nested_attributes_for :user_disorders
  validates :name, presence: true
  validates :description, presence: true 



# only creating a disorder if it's not already there
  # def user_disorder_attributes=(narrative)
  #   self.user_disorder = UserDisorder.create(:narrative)
  # end
  # #
  #   def user_disorder_narrative
  #     self.user_disorder ? self.user_disorder.narrative : nil
  #   end

  # def user_disorder_attributes=(user_disorder_attributes)
  #  user_disorder_attributes.values.each do |user_disorder_attribute|
  #    user_disorder = UserDisorder.find_or_create_by(user_disorder_attribute)
  #    self.user_disorders << user_disorder
  #  end
 end
