require 'rails_helper'

describe Sentence do
  it { should validate_presence_of :story_id}
  it { should validate_presence_of :image_id}
  it { should validate_presence_of :content}
  it { should validate_presence_of :username}
  it { should belong_to :story}
  it { should belong_to :image}
end
