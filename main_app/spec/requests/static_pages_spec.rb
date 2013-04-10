require 'spec_helper'

describe "StaticPages" do
	subject { page }
  describe "GET /static_pages" do
    it "should render helpdesk page" do
      #get helpdesk_support_path
      #response.status.should be(200)
    end
  end
  describe 'career page' do  
    before { visit career_path }
    it { should have_selector('title',text:'Careers Page') }
    it { should have_selector('p',text:'Current Openings')}
  end

  describe 'contact us page' do
  	before { visit contact_us_path }
  	it { should have_selector('title',text: 'Contact SupportSages') }
  	it { should have_selector('p',text:'Contact Us')}
  	it { should have_content('Door No 27/605D')}
  	it { should have_content('Edapally Toll')}
  	it { should have_content('Pookkattupady Road')}
  	it { should have_content('Kochi - 682024')}
  	it { should have_content('Kerala, India')}
  end

  describe 'corporate page' do
    before { visit corporate_path }
    it { should have_selector('title',text:'Corporate')}
    it { should have_selector('p',text: 'Our Philosophy')}
    it { should have_selector('p', text:'Corporate')}
    it { should have_content('dare to speak the truth')}
    it { should have_content('Keep Reinventing yourself')}
    it { should have_content('Be Humane')}
    it { should have_content('Ignorance is not a crime, Inertia is')}
    it { should have_content('Be What You are')}
    it { should have_content('Excellence is a habit')}
    it { should have_content('impossible is not possible')}
    it { should have_content('Temporary is not permanent')}

  end

end
