module StaticPagesHelper
	#Method to check if the params are the action according to link_to
	def current_class_css(kontroller,action)
		(params[:controller].eql?(kontroller) && params[:action].eql?(action)) ? "nav_a_bg_color current-page" : 'nav_a_bg_color'
	end
end
