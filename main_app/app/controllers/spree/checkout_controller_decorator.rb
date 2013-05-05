Spree::CheckoutController.class_eval do

  def before_payment
    puts 'Method to override super(before_payment)'
  end

end
