class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user

  has_many :comments, as: :commentable
  has_many :votes, as: :voteable, dependent: :destroy

  validates :body, presence: true
end
