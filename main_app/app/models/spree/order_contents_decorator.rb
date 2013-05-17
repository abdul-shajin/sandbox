Spree::OrderContents.class_eval do

  def add(variant, quantity,duration, interval, currency=nil, shipment=nil)
    #get current line item for variant if exists
    line_item = order.find_line_item_by_variant(variant)

    #add variant qty to line_item
    add_to_line_item(line_item, variant, quantity, duration, interval, currency, shipment)
  end

  def add_to_line_item(line_item, variant, quantity,duration,interval, currency=nil, shipment=nil)
     if line_item
       line_item.target_shipment = shipment
       line_item.quantity = 1 if variant.subscribable?
       line_item.currency = currency unless currency.nil?
       line_item.duration = duration
       line_item.interval = interval
       line_item.save
     else
       line_item = Spree::LineItem.new(quantity: quantity)
       line_item.target_shipment = shipment
       line_item.variant = variant
       line_item.duration = duration
       line_item.interval = interval
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


