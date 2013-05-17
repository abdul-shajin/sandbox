class RemoveStartsAtFromSubscription < ActiveRecord::Migration
  def change
    remove_column :spree_subscriptions , :starts_at
  end
end
