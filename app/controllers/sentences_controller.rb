class SentencesController < ApplicationController

  def create
    @story = Story.find(params[:sentence][:story_id].to_i)
    @sentence = Sentence.new(sentence_params)
    if @sentence.save
      redirect_to @story
    else
      render "stories/show"
    end
  end

private

  def sentence_params
    params.require(:sentence).permit(:content, :username, :image_id, :story_id)
  end
end
