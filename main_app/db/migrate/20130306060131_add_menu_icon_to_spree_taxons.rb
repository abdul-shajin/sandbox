class AddMenuIconToSpreeTaxons < ActiveRecord::Migration
  def change
  	add_column :spree_taxons, :menu_icon, :string
  end
end
