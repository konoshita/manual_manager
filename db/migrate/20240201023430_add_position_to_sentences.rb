class AddPositionToSentences < ActiveRecord::Migration[7.0]
  def change
    add_column :sentences, :position, :integer
  end
end
