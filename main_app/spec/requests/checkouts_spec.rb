require 'spec_helper'

describe "Checkouts" do
  let(:product) { Factory(:product)}
  let(:sub_product) { Factory(:subscribable_product,:name => 'sport maganize')}

  describe "nice checkouts traversal - first step" do
    it 'should increment line item count by 1' do
      visit spree.product_path(sub_product)
      page.should have_selector("input", :type => "hidden")
      page.should have_content(I18n.t(:subscribable_product))
    end
  end
end
