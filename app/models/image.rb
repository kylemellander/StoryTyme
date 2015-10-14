class Image < ActiveRecord::Base
  validates_presence_of :url
  has_many :sentences

  def self.random_five
    Image.all.sample(5)
  end
end
