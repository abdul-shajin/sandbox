class AddDisplayNameToVariants < ActiveRecord::Migration
  def change
    add_column :spree_variants, :display_name, :string
  end
end
