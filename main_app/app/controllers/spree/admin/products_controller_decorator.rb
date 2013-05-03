Spree::Admin::ProductsController.class_eval do
  
  def update
        if params[:product][:taxon_ids].present?
          params[:product][:taxon_ids] = params[:product][:taxon_ids].split(',')
          #Only leaves will be displayed in admin panel
          #So we have to add the ancestors to the product.4 lines is for that
          params[:product][:taxon_ids].each do |tax|
            Spree::Taxon.find(tax).ancestors.each {|taxxon| params[:product][:taxon_ids] << taxxon.id }
          end
          params[:product][:taxon_ids].uniq!
        end
        if params[:product][:option_type_ids].present?
          params[:product][:option_type_ids] = params[:product][:option_type_ids].split(',')
        end
        super
  end  
end