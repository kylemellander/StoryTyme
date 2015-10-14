class Image < ActiveRecord::Base
  validates_presence_of :url
  has_many :sentences   
end
