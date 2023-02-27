class AddImagesToMushrooms < ActiveRecord::Migration[6.1]
  def change
    add_column :mushrooms, :images, :string
  end
end
