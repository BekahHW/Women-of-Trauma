class Disorder < ApplicationRecord
  has_many :user_disorders
  has_many :user_disorder_treatments, through: :user_disorders
  has_many :users, through: :user_disorders
  has_many :treatments, through: :user_disorder_treatments

  accepts_nested_attributes_for :user_disorders
  validates :name, presence: true
  validates :description, presence: true

 end
