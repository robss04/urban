User.destroy_all
Invoice.destroy_all
Selection.destroy_all

u = User.create({
  email: "robyn@robyn.com",
  given_name: "robyn",
  family_name: "steinberg",
  delivery_address: "Woodbury, NY 11797",
  billing_address: "New York, NY 10012",
  phone: "555-555-5555"
})

u2 = User.create({
  email: "email@robyn.com",
  given_name: "givenname",
  family_name: "familyname",
  delivery_address: "Delivery Address, NY 11797",
  billing_address: "Billing Address, NY 10012",
  phone: "555-555-8888"
})

spaghetti = Item.create({
  name: 'Spaghetti'
})

meatballs = Item.create({
  name: 'Meatballs'
})

bread = Item.create({
  name: 'Garlic bread'
})

i = Invoice.create({
  status: "delivered",
  ordered_on: Time.now - 5.days,
  user: u,
  selections: Selection.create([
    {
      item: spaghetti,
      quantity: 5
    },
    {
      item: meatballs,
      quantity: 5
    },
    {
      item: bread,
      quantity: 3
    }
  ])
})

# :invoice, index: true
#       t.references :item, index: true
#       t.integer :quantity