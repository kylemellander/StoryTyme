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
  end

  def create
    image = Image.find(params[:story][:image].to_i)
    @story = Story.new(story_params)
    if @story.save
      sentence = Sentence.new(image_id: params[:story][:image].to_i,
                              content: params[:story][:sentence],
                              story_id: @story.id,
                              username: params[:story][:username])
      if sentence.save
        redirect_to @story
      else
        flash[:alert] = ""
        sentence.errors.full_messages.each do |message|
          flash[:alert] += message
        end
        redirect_to new_sentence_path(@story)
      end
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



  private

  def story_params
    params.require(:story).permit(:title, :subtitle)
  end

end
