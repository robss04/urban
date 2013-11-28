class CreateSelections < ActiveRecord::Migration
  def change
    create_table :selections do |t|
      t.references :invoice, index: true
      t.references :item, index: true
      t.integer :quantity

      t.timestamps
    end
  end
end
