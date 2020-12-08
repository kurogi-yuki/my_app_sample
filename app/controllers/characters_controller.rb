class CharactersController < ApplicationController
  before_action :set_character, only: %i(show edit update destroy)

  def index
    @characters = Character.order(:id).includes(:story)
  end

  def show
  end

  def new
    @character = Character.new
    @story = Story.find(params[:story_id])
  end

  def create
    @character = Character.new(character_params)
    if @character.save
      redirect_to :story_characters
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @character.update!(character_params)
      redirect_to :story_characters
    else
      render :edit
    end
  end

  def destroy
    @character.destroy!
    redirect_to :story_characters
  end

  private

  def character_params
    params.require(:character).permit(:character_name, :age, :gender).merge(story_id: params[:story_id])
  end

  def set_character
    @character = Character.find(params[:id])
  end
end
