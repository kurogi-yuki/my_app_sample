class StoriesController < ApplicationController
  before_action :set_story, only: %i(edit update destroy)

  def index
    @stories = Story.order(:id).includes(:user)
  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(story_params)
    @story.user_id = current_user.id
    if @story.save
      redirect_to :stories
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @story.update!(story_params)
      redirect_to :stories
    else
      render :edit
    end
  end

  def destroy
    @story.destroy!
    redirect_to :stories
  end

  private

  def story_params
    params.require(:story).permit(:title, :outline, :genre)
  end

  def set_story
    @story = current_user.stories.find(params[:id])
  end
end
