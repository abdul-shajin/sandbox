Deface::Override.new(:virtual_path => 'spree/orders/show',
										 :insert_after => "fieldset",
                                                                   :name => "pdf_download_link",
                                                                   :text => '<%= link_to "Download Invoice","#{request.fullpath}.pdf", class: "button" %>',
                                                                   :original => '47220ab91551470eae354fe365077a2786a8ec0b'
                                    )
