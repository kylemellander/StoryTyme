class StoriesController < ApplicationController

  def index
    @stories = Story.all
  end

  def show
    @story = Story.find(params[:id])
    @sentence = Sentence.new
  end

  def new
    @story = Story.new
    @sentence = Sentence.new
  end

  def create
    @story = Story.new(story_params)
    @sentence = Sentence.new(sentence_params)
    if @story.valid? && @sentence.valid?
      @story.save
      @sentence.story_id = @story.id
      @sentence.save
      redirect_to @story
    else
      render :new
    end
  end

  def edit
    @story = Story.find(params[:id])
  end

  def update
    @story = Story.find(params[:id])
      if @story.update(story_params)
        redirect_to @story
      else
        render :edit
      end
  end

  def full_view
    @story = Story.find(params[:id]) 

  end

  def destroy
    @story = Story.find(params[:id])
    @story.sentences.each do |sentence|
      sentence.destroy
    end
    @story.destroy
    redirect_to stories_path
  end



  private

  def story_params
    params.require(:story).permit(:title, :subtitle)
  end

  def sentence_params
    params.require(:sentence).permit(:username, :content, :image_id)
  end

end
