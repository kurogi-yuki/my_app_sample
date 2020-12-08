class Character < ApplicationRecord
  belongs_to :story
  validates :character_name, presence: true
  validates :age, presence: true
  validates :gender, presence: true

  def story_title
    story.title
  end
end
