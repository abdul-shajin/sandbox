p 'loading utilities.rb'
RSpec::Matchers::define :have_title do |text|
	edge = text.blank? ? '' : ' - '
  match do |page|
    Capybara.string(page.body).has_selector?('title', text: (text + edge + 'SupportSages'))
  end
end