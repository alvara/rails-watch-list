class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, length: { minimum: 6 }

  # prevents duplicate pairs from occurring, each will be unique combo
  # order does not matter
  validates :movie, uniqueness: { scope: :list }
end
