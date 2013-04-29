module ApplicationHelper
	def string_to_underscore(string)
	    string.downcase.gsub(/\s+/,'_')
	end
	def product_link(permalink)
		spree.product_path(Spree::Product.find_by_permalink!(permalink))
	end
end
