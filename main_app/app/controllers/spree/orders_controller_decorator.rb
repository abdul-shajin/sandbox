Spree::OrdersController.class_eval do

  # Shows the current incomplete order from the session
  def edit
    @order = current_order(true)
    associate_user
  end

  def populate
    populator = Spree::OrderPopulator.new(current_order(true), current_currency)
    #Added a new parameter :line_item to add recurring period to subscribe
    if populator.populate(params.slice(:products, :variants, :quantity,:line_item))
      fire_event('spree.cart.add')
      fire_event('spree.order.contents_changed')
      respond_with(@order) do |format|
        format.html { redirect_to cart_path }
      end
    else
      flash[:error] = populator.errors.full_messages.join(" ")
      redirect_to :back
    end
  end

  def show
    @order = Spree::Order.find_by_number!(params[:id])
    respond_to do |format|
        format.pdf  { send_data @order.invoice.generate_pdf, :filename => "#{@order.invoice.invoice_number}.pdf", :type => 'application/pdf' }
        format.html
    end
  end

  def update
    @order = current_order
    if @order.update_attributes(params[:order])
      return if after_update_attributes
      @order.line_items = @order.line_items.select {|li| li.quantity > 0 }
      fire_event('spree.order.contents_changed')
      respond_with(@order) do |format|
        format.html do
          if params.has_key?(:checkout)
            @order.next_transition.run_callbacks if @order.next_transition.present?
            redirect_to checkout_state_path(@order.checkout_steps.first)
          else
            redirect_to cart_path
          end
        end
      end
    else
      respond_with(@order)
    end
  end

end


