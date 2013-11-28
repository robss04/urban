class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :given_name
      t.string :family_name
      t.text :delivery_address
      t.text :billing_address
      t.text :phone

      t.timestamps
    end
  end
end
