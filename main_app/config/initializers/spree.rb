# Configure Spree Preferences
#
# Note: Initializing preferences available within the Admin will overwrite any changes that were made through the user interface when you restart.
#       If you would like users to be able to update a setting with the Admin it should NOT be set here.
#
# In order to initialize a setting do:
# config.setting_name = 'new value'
Spree.config do |config|
  # Example:
  # Uncomment to override the default site name.
  # config.site_name = "Spree Demo Site"
end

Spree.user_class = "Spree::User"
require 'spree/product_filters'

Spree::AppConfiguration.class_eval do
  preference :address_requires_state, :boolean, default: false # should state/state_name be required
  preference :emails_sent_from, :string, default: 'spree@example.com'
  preference :site_url, :string, default: 'beta.supportsages.com'
  preference :site_name, :string, default: 'SupportSages'
  preference :default_meta_description, :string, default: 'SupportSages'
  preference :allow_guest_checkout, :boolean, default: false
end
