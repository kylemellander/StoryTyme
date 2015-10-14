class Story < ActiveRecord::Base
  validates_presence_of :title, :subtitle
  has_many :sentences  
end
