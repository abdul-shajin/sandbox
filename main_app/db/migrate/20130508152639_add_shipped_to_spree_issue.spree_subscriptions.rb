# This migration comes from spree_subscriptions (originally 20120801134107)
class AddShippedToSpreeIssue < ActiveRecord::Migration
  def change
    add_column :spree_issues, :shipped_at, :datetime
  end
end
