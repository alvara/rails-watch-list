class List < ApplicationRecord
  has_many :bookmarks

  # destroy child movies 
  has_many :movies, through: :bookmarks, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: true
end
