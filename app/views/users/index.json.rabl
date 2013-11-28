object false

child @users, object_root: false do

  attributes :id, :email, :given_name, :family_name, :delivery_address, :billing_address, :phone

  node :href do |user|
    user_url(user)
  end

  node :links do |user|
    {
      invoices: user_invoices_url(user)
    }
  end

end