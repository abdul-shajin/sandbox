Spree::LineItem.class_eval do

  delegate :user, to: :order
end
