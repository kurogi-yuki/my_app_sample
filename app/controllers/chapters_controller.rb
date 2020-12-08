class ChaptersController < ApplicationController
  before_action :set_chapter, only: %i(show edit update destroy)

  def index
    @chapters = Chapter.order(:id).includes(:story)
  end

  def new
    @chapter = Chapter.new
    @story = Story.find(params[:story_id])
  end

  def create
    @chapter = Chapter.new(chapter_params)
    if @chapter.save
      redirect_to :story_chapters
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @chapter.update!(chapter_params)
      redirect_to :story_chapters
    else
      render :edit
    end
  end

  def destroy
    @chapter.destroy!
    redirect_to :story_chapters
  end

  private

  def chapter_params
    params.require(:chapter).permit(:chapter_title, :content, :writing).merge(story_id: params[:story_id])
  end

  def set_chapter
    @chapter = Chapter.find(params[:id])
  end
end
