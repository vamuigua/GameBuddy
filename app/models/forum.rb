class Forum < ApplicationRecord
  acts_as_votable
  belongs_to :user
  has_many :comments, as: :commentable
end
