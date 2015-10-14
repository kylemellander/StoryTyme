class Story < ActiveRecord::Base
  validates_presence_of :title, :subtitle
  has_many :sentences

  def all_authors
    authors = []
    self.sentences.each do |sentence|
      if !authors.include?(sentence.username)
        authors.push(sentence.username)
      end
    end
    authors.join(", ")
  end
end
