class SentenceValidator < ActiveModel::Validator
  def validate(record)
    if record.content[-1, 1] != "."
      record.errors[:base] << "Your sentence must end in a period."
    end
  end
end

class Sentence < ActiveRecord::Base
  validates_presence_of :image_id, :content, :username
  validates_with SentenceValidator
  belongs_to :story
  belongs_to :image
end
