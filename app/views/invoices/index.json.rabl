collection @invoices

attributes :delivery_on, :delivery_at, :status

node :href do |invoice|
  user_invoice_url(@user, invoice)
end

node :links do |invoice|
  {
    user: user_url(@user)
  }
end

child :selections do
  attributes :quantity

  node :item do |selection|
    selection.item
  end
end
