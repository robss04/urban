class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.datetime :ordered_on
      t.datetime :delivery_on
      t.datetime :delivery_at
      t.text :status
      t.references :user, index: true

      t.timestamps
    end
  end
end
