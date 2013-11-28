collection @selections

attributes :item, :quantity

node :href do |selection|
  user_invoice_selection_url(@invoice, selection)
end

node :links do |selection|
  {
    invoice: user_invoice_url(@invoice)
  }
end

