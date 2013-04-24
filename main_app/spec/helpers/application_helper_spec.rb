require 'spec_helper'

describe ApplicationHelper do
	describe '#string_to_underscore' do
		it 'returns underscored sting' do
			helper.string_to_underscore('lorem ipsum').should eq('lorem_ipsum')
		end
	end
end