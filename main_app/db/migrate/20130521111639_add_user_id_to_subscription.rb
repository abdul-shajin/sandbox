class AddUserIdToSubscription < ActiveRecord::Migration
  def change
    change_table :spree_subscriptions do |t|
      t.references :user
    end
  end
end
