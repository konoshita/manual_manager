class AddJudgeToQuizzes < ActiveRecord::Migration[7.0]
  def change
    add_column :quizzes, :judge, :integer
  end
end
