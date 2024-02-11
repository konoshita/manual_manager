class Admin::QuestionsController < Admin::BaseController
  before_action :set_question, only: %i[ show edit update destroy]
  before_action :set_quiz, only: %i[ show edit update destroy]
  
  def new
    @quiz = Quiz.find(params[:quiz_id])
    @question = @quiz.questions.new
    4.times { @question.choices.build }
  end

  def create
    @quiz = Quiz.find(params[:quiz_id])
    @question = Question.new(question_params)
    if @question.save
      redirect_to admin_quiz_path(@quiz)
    else
      flash[:danger] = "クイズの作成が失敗しました。もう一度試してください。"
      redirect_back(fallback_location: root_path)  #同上
    end
  end

  def edit;end
  
  def update
    @question.assign_attributes(question_params)
      if @question.update(question_params)
        redirect_to admin_quiz_path(@quiz)
      else
          flash.now[:danger] = t('defaults.message.not_updated', item: User.model_name.human)
          render :edit
      end
  end
  
  def destroy
    @question.choices.destroy_all
    redirect_to admin_quiz_path(@quiz) ,notice: "Quiz was successfully destroyed."
  end

  private
  def set_question
    @question = Question.find(params[:quiz_id])
  end
  def set_quiz
    @quiz = Quiz.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body, :quiz_id,
      choices_attributes: [:content, :is_answer])  #formにてpost_idパラメータを送信して、コメントへpost_idを格納するようにする必要がある。
  end
end
