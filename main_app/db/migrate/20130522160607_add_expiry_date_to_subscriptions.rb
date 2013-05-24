class AddExpiryDateToSubscriptions < ActiveRecord::Migration
  def change
    add_column :spree_subscriptions, :expiry_date, :datetime
  end
end
