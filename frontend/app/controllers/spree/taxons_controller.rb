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
      render layout: 'main'
    end

    def access_child_dropdown
      taxon = Taxon.find(params[:t_id])
      @children = taxon.children.select([:id,:name,:permalink]) if taxon
      respond_to do |format|
        if !@children.empty?
          format.html { render :nothing => true ,:status => 201 }
          format.json { render :json => @children}
        else
          format.html { render nothing: true, status: 201}
          format.json { render :json => ['last_node',taxon.id]}
          #render :nothing => true , :status => 422
        end  
      end  
    end

    def filter_group
      #a Click to taxons will reach here
      #clicked taxon parent will be hidden by this group
      #clicked taxon will be in the top as selected
      @taxon = Taxon.find_by_permalink!(params[:id])
      @selected_taxons = Taxon.where(:id => params[:perm])
      #@relevent_taxons = (@taxon.children - @selected_taxons.map(&:parent))
      @rules = []
      @selected_taxons.each do |taxon|
        rule_hash = Rule::RULES[taxon.parent.permalink]
        @rules << rule_hash unless rule_hash.nil? 
      end
      @rules.flatten!
      @products = Product.in_taxons(@selected_taxons).where(:deleted_at => nil)
      render layout: 'main'
    end

    def access_child_dropdown
      taxon = Taxon.find(params[:t_id])
      @children = taxon.children.select([:id,:name,:permalink]) if taxon
      respond_to do |format|
        if !@children.empty?
          format.html { render :nothing => true ,:status => 201 }
          format.json { render :json => @children}
        else
          format.html { render nothing: true, status: 201}
          format.json { render :json => ['last_node',taxon.id]}
          #render :nothing => true , :status => 422
        end  
      end  
    end

    private

    def accurate_title
      if @taxon
        @taxon.seo_title
      else
        super
      end
    end

  end
end
