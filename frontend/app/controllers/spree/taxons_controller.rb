module Spree
  class TaxonsController < Spree::StoreController
    rescue_from ActiveRecord::RecordNotFound, :with => :render_404
    helper 'spree/products'

    respond_to :html

    def show
      @taxon = Taxon.find_by_permalink!(params[:id])
      @ancestors = @taxon.ancestors
      find_parent = @taxon
      @parents = []
      until find_parent.parent.eql?(nil) do
        @parents << find_parent.parent
        find_parent = find_parent.parent
      end
      return unless @taxon

      @searcher = Spree::Config.searcher_class.new(params.merge(:taxon => @taxon.id))
      @searcher.current_user = try_spree_current_user
      @searcher.current_currency = current_currency
      @products = @searcher.retrieve_products
    end

    def access_child_dropdown
      taxon = Taxon.find(params[:t_id])
      @children = taxon.children.select([:id,:name,:permalink]) if taxon
      if @children
        respond_to do |format|
          format.html { render :nothing => true ,:status => 201 }
          format.json { render :json => @children}
        end
      else
        render :nothing => true , :status => 422
      end  
    end

    private
      def accurate_title
        @taxon ? @taxon.name : super
      end
  end
end
