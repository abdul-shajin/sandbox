Spree::OrderContents.class_eval do
  def add_to_line_item(line_item, variant, quantity, currency=nil, shipment=nil)
     if line_item
       line_item.target_shipment = shipment
       line_item.quantity += quantity
       line_item.currency = currency unless currency.nil?
       line_item.save
     else
       line_item = Spree::LineItem.new(quantity: quantity)
       line_item.target_shipment = shipment
       line_item.variant = variant
       if currency
         line_item.currency = currency unless currency.nil?
         line_item.price    = variant.price_in(currency).amount
       else
         line_item.price    = variant.price
       end
       order.line_items << line_item
       line_item
     end
     order.reload
     line_item
  end


end


