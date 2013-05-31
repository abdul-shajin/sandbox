Spree.updateVariantPrice = (variant) ->
  variantPrice = variant.data('price')
  ($ '.price.selling').text(variantPrice) if variantPrice

$ ->
  ($ '#product-variants select').change (event) ->
    console.log 'ivideyethi machaane'
    variant_price = $(this).children(":selected").data('price')
    ($ '.price.selling').text(variant_price) if variant_price
