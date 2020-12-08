class Story < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :outline, presence: true
  validates :genre, presence: true
end
