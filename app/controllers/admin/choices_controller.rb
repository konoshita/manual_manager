class Admin::ChoicesController < Admin::BaseController
  before_action :set_choice, only: %i[ show edit update destroy]
  before_action :set_question, only: %i[ show edit update destroy]
  
  def create
    @question = Qusetion.find(params[:question_id])
    @choice = Choice.new(choice_params)
    if @choice.save
      redirect_back(fallback_location: root_path)  #コメント送信後は、一つ前のページへリダイレクトさせる。
    else
      flash[:danger] = "クイズの作成が失敗しました。もう一度試してください。"
      redirect_back(fallback_location: root_path)  #同上
    end
  end

  def edit;end
  
  def update
    @choice.assign_attributes(choice_params)
      if @choice.update(choice_params)
        redirect_to admin_question_path(@question)
      else
          flash.now[:danger] = t('defaults.message.not_updated', item: User.model_name.human)
          render :edit
      end
  end
  
  def destroy
    @choice.destroy
    redirect_to admin_question_path(@question) ,notice: "Question was successfully destroyed."
  end

  private
  def set_choice
    @choice = Choice.find(params[:question_id])
  end
  def set_question
    @question = Question.find(params[:id])
  end

  def choice_params
    params.require(:choice).permit(:content, :is_answer, :question_id )
  end
end
