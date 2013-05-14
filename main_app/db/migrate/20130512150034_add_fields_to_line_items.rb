class AddFieldsToLineItems < ActiveRecord::Migration
  def change
    remove_column :spree_variants, :interval
    add_column :spree_line_items, :duration, :string
    add_column :spree_line_items, :interval , :string
  end
end
