class UpdateFieldsInIssues < ActiveRecord::Migration
  def change
    rename_column :spree_issues, :published_at, :remind_at
    add_column :spree_issues ,  :subscription_id, :integer, references: :spree_subscriptions
    add_column :spree_subscriptions , :starts_at, :datetime
  end
end
