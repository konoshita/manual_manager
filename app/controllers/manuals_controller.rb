class ManualsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_manual, only: %i[ show ]
  def index
    @q = Manual.ransack(params[:q])
    @manuals = @q.result(distinct: true).includes(:user).order(created_at: :desc)
  end
  def new
    @manual = Manual.new
  end

  def show
    @sentence = Sentence.new
    @sentences = @manual.sentences.order(:position) 
    @comment = current_user.comments.new
    @my_comment = @manual.comments.where(user_id: current_user.id).includes(:user).last
  end

  def bookmarks
    @bookmark_manuals = current_user.bookmark_manuals.includes(:user).order(created_at: :desc)
  end
 

  private

  def set_manual
      @manual = Manual.find(params[:id])
  end
  
  def manual_params
      params.require(:manual).permit(:title, :user_id, :category_id)
  end
end
