Deface::Override.new(:virtual_path => 'spree/shared/_footer',
										 :replace => "p",
                     :original => '5d699cfa625e9a13ec861bbe22897d1f8db0db35',
                     :name => "footer_link_edit",
                     :text => "<p><%= t :powered_by %> <%= link_to 'SupportSages', 'http://supportsages.com/' %></p>"
                     )
