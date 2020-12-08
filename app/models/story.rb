class Story < ApplicationRecord
  belongs_to :user
  has_many :chapters, dependent: :destroy
  has_many :characters, dependent: :destroy
  validates :title, presence: true
  validates :outline, presence: true
  validates :genre, presence: true
end
