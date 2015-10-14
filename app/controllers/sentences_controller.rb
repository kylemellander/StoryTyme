class SentencesController < ApplicationController

  def create
    image = Image.find(params[:sentence][:image_id].to_i)
    story = Story.find(params[:sentence][:story_id].to_i)
    @sentence = Sentence.new(sentence_params)
    @sentence.save
      redirect_to story
  end

private

  def sentence_params
    params.require(:sentence).permit(:content, :username, :image_id, :story_id)
  end
end
