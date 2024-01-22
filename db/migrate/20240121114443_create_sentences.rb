class CreateSentences < ActiveRecord::Migration[7.0]
  def change
    create_table :sentences do |t|
      t.text :content
      t.references :manual, foreign_key: true
      t.timestamps
    end
  end
end
