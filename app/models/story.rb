class Story < ApplicationRecord
  belongs_to :user
  has_many :chapters, dependent: :destroy
  validates :title, presence: true
  validates :outline, presence: true
  validates :genre, presence: true
end
