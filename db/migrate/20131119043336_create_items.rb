class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price
      t.text :ingredients
      t.string :category
      t.integer :time_to_cook

      t.timestamps
    end
  end
end
