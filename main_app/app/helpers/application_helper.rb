module ApplicationHelper
	def string_to_underscore(string)
	    string.downcase.gsub(/\s+/,'_')
	end
	def product_link(permalink)
		Spree::Product.exists?(:permalink => permalink) ? spree.product_path(Spree::Product.find_by_permalink!(permalink)) : "#"
	end
end
