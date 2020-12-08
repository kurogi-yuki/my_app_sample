class Chapter < ApplicationRecord
  belongs_to :story
  validates :chapter_title, presence: true
  validates :content, presence: true
  validates :writing, presence: true

  def story_title
    story.title
  end

  def story_characters
    story.characters
  end
end
