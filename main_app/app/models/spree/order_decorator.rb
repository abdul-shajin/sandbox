Spree::Order.class_eval do
  checkout_flow do
      go_to_state :address
      go_to_state :payment, :if => lambda { |order| order.payment_required? }
      go_to_state :confirm, if: ->(order) { order.confirmation_required? }
      go_to_state :complete, if: ->(order) {
        (order.payment_required? && order.has_unprocessed_payments?) || !order.payment_required?
      }
  end

  def product_names
    products.map(&:name)
  end

  def finalize!
      touch :completed_at

      # lock all adjustments (coupon promotions, etc.)
      adjustments.each { |adjustment| adjustment.update_column('state', "closed") }

      # update payment and shipment(s) states, and save
      updater.update_payment_state
      shipments.each do |shipment|
        shipment.update!(self)
        shipment.finalize!
      end

      #updater.update_shipment_state
      save
      updater.run_hooks

      deliver_order_confirmation_email

      self.state_changes.create({
        previous_state: 'cart',
        next_state:     'complete',
        name:           'order' ,
        user_id:        self.user_id
      }, without_protection: true)

      subscription_steps
    end

  private
  #Do the addition to subscription fields
  def subscription_steps
    p 'controll over subsciption steps - orde decorator'
    if contains_subscription?
      p 'contain subscription checking true'
      create_subscriptions
    end
  end

  def contains_subscription?
    line_items.any? {|line_item| line_item.subscribable?}
  end

  def create_subscriptions
    order = self
    order.line_items.each do |line_item|
      if line_item.subscribable?
        p 'in create_subscriptions subscribabe'
        subscription = Spree::Subscription.new_subscription(self, line_item)
      end
    end
  end
end
