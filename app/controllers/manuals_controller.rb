class ManualsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_manual, only: %i[ show ]
  def index
    @manuals = Manual.all.includes(:user).order(created_at: :desc)
  end
  def new
    @manual = Manual.new
  end

  def show
    @sentence = Sentence.new
    @sentences = @manual.sentences
  end
 

  private

  def set_manual
      @manual = Manual.find(params[:id])
  end
  
  def manual_params
      params.require(:manual).permit(:title, :user_id, :category_id)
  end
end
