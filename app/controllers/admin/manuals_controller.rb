class Admin::ManualsController < Admin::BaseController
  before_action :authenticate_user!
  before_action :set_manual, only: %i[ show edit update delete]

  def index
    @manuals = Manual.all
  end
  def new
    @manual = Manual.new
  end

  def show; end

  def edit; end

  def update
      if @manual.update(manual_params)
          redirect_to admin_manual_path(@manual), success: t('defaults.message.updated', item: User.model_name.human)
      else
          flash.now[:danger] = t('defaults.message.not_updated', item: User.model_name.human)
          render :edit
      end
  end

  def create
    @manual = Manual.new(manual_params)
    @manual.state = :draft

    if @manual.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def set_manual
      @manual = Manual.find(params[:id])
  end
  
  def manual_params
      params.require(:manual).permit(:title, :user_id, :category_id)
  end
end
