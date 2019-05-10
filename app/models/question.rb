class Question < ApplicationRecord
	belongs_to :user

	has_many :comments, as: :commentable, dependent: :destroy
	has_many :votes, as: :voteable, dependent: :destroy
	has_many :answers, dependent: :destroy
	
	validates :title, presence: true
	validates :description, presence: true
end