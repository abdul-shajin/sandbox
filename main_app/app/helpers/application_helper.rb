module ApplicationHelper
	def string_to_underscore(string)
	    string.downcase.gsub(/\s+/,'_')
	end
end
