class Sentence < ActiveRecord::Base
  validates_presence_of :story_id, :image_id, :content, :username
  belongs_to :story
  belongs_to :image
end
