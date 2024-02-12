class QuizzesController < ApplicationController
  before_action :set_quiz, only: %i[ show edit]

  # GET /quizzes or /quizzes.json
  def index
    @quizzes = Quiz.all
  end

  # GET /quizzes/1 or /quizzes/1.json
  def show
    @question = Question.new
    @questions = @quiz.questions
  end

  # GET /quizzes/new
  def new
    @quiz = Quiz.new
  end

  def judge
    @choice = Choice.find(params[:id])
      if @choice.is_answer == true
        flash[:notice] = '正解'
        redirect_to request.referer
      else
        flash[:notice] = '違います'
        redirect_to request.referer
      end
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
