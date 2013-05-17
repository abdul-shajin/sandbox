Spree::OrderPopulator.class_eval do

  def populate(from_hash)
    @duration = from_hash[:line_item][:duration] if from_hash[:line_item]
    @interval = from_hash[:line_item][:interval] if from_hash[:line_item]
    from_hash[:products].each do |product_id,variant_id|
      attempt_cart_add(variant_id, from_hash[:quantity],@duration,@interval)
    end if from_hash[:products]

    from_hash[:variants].each do |variant_id, quantity|
      attempt_cart_add(variant_id, quantity,@duration,@interval)
    end if from_hash[:variants]

    valid?
  end

  private
  def attempt_cart_add(variant_id, quantity,duration = nil,interval= nil)
    quantity = quantity.to_i
    duration = duration.to_i
    # 2,147,483,647 is crazy.
    # See issue #2695.
    if quantity > 2_147_483_647
      errors.add(:base, Spree.t(:please_enter_reasonable_quantity, :scope => :order_populator))
      return false
    end

    variant = Spree::Variant.find(variant_id)
    if quantity > 0
      if check_stock_levels(variant, quantity)
        @order.contents.add(variant, quantity,duration,interval, currency)
      end
    end
  end
end
