Deface::Override.new(:virtual_path => 'spree/checkout/_payment',
                     :remove => "p.field",
                     :name => "remove_coupon_code_from_payment",
                     :text => ""
                     )
