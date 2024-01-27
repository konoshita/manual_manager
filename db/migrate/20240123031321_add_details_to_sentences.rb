class AddDetailsToSentences < ActiveRecord::Migration[7.0]
  def change
    add_column :sentences, :subtitle, :string
    add_column :sentences, :sentence_image, :string
  end
end
