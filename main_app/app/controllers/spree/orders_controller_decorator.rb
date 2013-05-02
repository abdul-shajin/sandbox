Spree::OrdersController.class_eval do
  def show
    @order = Spree::Order.find_by_number!(params[:id])
    respond_to do |format|
        format.pdf  { send_data @order.invoice.generate_pdf, :filename => "#{@order.invoice.invoice_number}.pdf", :type => 'application/pdf' }
        format.html
    end
  end
end
