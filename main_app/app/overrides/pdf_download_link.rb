Deface::Override.new(:virtual_path => 'spree/orders/show',
										 :insert_after => "fieldset",
                     :name => "pdf_download_link",
                     :text => '<%= link_to "Download Invoice","#{request.fullpath}.pdf", class: "button" %>'
                     )