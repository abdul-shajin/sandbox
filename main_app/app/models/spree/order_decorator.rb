Spree::Order.class_eval do
  checkout_flow do
      go_to_state :address
      go_to_state :delivery #- Removed d delivery system
      go_to_state :payment, :if => lambda { |order| order.payment_required? }
      go_to_state :confirm, if: ->(order) { order.confirmation_required? }
      go_to_state :complete, if: ->(order) {
        (order.payment_required? && order.has_unprocessed_payments?) || !order.payment_required?
      }
      remove_transition from: :delivery, to: :confirm
  end
end
