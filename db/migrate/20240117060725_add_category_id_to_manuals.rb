class AddCategoryIdToManuals < ActiveRecord::Migration[7.0]
  def change
    add_column :manuals, :category_id, :integer
  end
end
