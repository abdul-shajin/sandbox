Spree::LineItem.class_eval do
  attr_accessible :duration, :interval
  delegate :user, to: :order
  delegate :subscribable? , to: :product


end
