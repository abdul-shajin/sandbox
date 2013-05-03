Spree::OrdersController.class_eval do

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


