class AddIntervalAndDurationToSpreeSubscriptions < ActiveRecord::Migration
  def change
    add_column :spree_subscriptions, :interval, :string
    add_column :spree_subscriptions, :duration, :string
  end
end
