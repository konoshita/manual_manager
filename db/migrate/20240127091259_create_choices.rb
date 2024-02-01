class CreateChoices < ActiveRecord::Migration[7.0]
  def change
    create_table :choices do |t|
      t.string :content
      t.boolean :is_answer
      t.references :question

      t.timestamps
    end
  end
end
