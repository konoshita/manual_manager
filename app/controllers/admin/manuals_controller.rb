class Admin::ManualsController < Admin::BaseController
  before_action :authenticate_user!
  before_action :set_manual, only: %i[ show edit update destroy]

  def index
    @manuals = Manual.all
  end
  def new
    @manual = Manual.new
  end

  def show
    @sentence = Sentence.new
    @sentences = @manual.sentences  #投稿詳細に関連付けてあるコメントを全取得
  end

  def edit; end

  def update
    authorize(Manual)
    @manual.assign_attributes(manual_params)
      if @manual.update(manual_params)
          redirect_to admin_manual_path(@manual), success: t('defaults.message.updated', item: User.model_name.human)
      else
          flash.now[:danger] = t('defaults.message.not_updated', item: User.model_name.human)
          render :edit
      end
  end

  def create
    authorize(Manual)
    @manual = current_user.manuals.build(manual_params)
    if @manual.save
      redirect_to admin_manual_path(@manual), success: t('defaults.message.updated', item: User.model_name.human)
    else
      flash[:danger] = "記事の作成が失敗しました。もう一度試してください。"
      render :new
    end
  end

  def destroy
    authorize(Manual)

    @manual.destroy

    redirect_to admin_manuals_path
  end

  private

  def set_manual
      @manual = Manual.find(params[:id])
      authorize @manual
  end
  
  def manual_params
      params.require(:manual).permit(:title, :user_id, :category_id)
  end
  def authorize_manual
    authorize Manual
  end
end
