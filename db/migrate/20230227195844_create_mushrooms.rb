class CreateMushrooms < ActiveRecord::Migration[6.1]
  def change
    create_table :mushrooms do |t|
      t.string :name
      t.string :description
      t.float :price
      t.integer :stock

      t.timestamps null: false
    end
  end
end
