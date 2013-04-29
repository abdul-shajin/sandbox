require 'spec_helper'

describe ApplicationHelper do
	describe '#string_to_underscore' do
		it 'returns underscored sting' do
			helper.string_to_underscore('lorem ipsum').should eq('lorem_ipsum')
		end
	end
	describe '#product_link' do
		it 'should return hash if there aint permalink' do
			helper.product_link('some-fake-permalink').should eq('#')
		end
	end
end