class Admin::QuizzesController < Admin::BaseController
  before_action :set_quiz, only: %i[ show edit update destroy ]

  # GET /quizzes or /quizzes.json
  def index
    @quizzes = Quiz.all
  end

  # GET /quizzes/1 or /quizzes/1.json
  def show
    @question = Question.new
    @questions = @quiz.questions  #投稿詳細に関連付けてあるコメントを全取得
  end

  # GET /quizzes/new
  def new
    @quiz = Quiz.new
  end

  # GET /quizzes/1/edit
  def edit
  end

  # POST /quizzes or /quizzes.json
  def create
    @quiz = Quiz.new(quiz_params)
      if @quiz.save
        redirect_to admin_quizzes_path(@quiz), notice: "Quiz was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /quizzes/1 or /quizzes/1.json
  def update
      if @quiz.update(quiz_params)
        redirect_to admin_quizzes_path(@quiz), notice: "Quiz was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
  end

  # DELETE /quizzes/1 or /quizzes/1.json
  def destroy
    @quiz.destroy
    redirect_to admin_quizzes_path, notice: "Quiz was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz
      @quiz = Quiz.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quiz_params
      params.require(:quiz).permit(:title)
    end
end
