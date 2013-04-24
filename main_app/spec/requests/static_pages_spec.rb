require 'spec_helper'

describe "StaticPages" do
	subject { page }
  
  describe 'root index page' do
    before { visit root_path }
    it { should have_title('')}
    it { should have_selector('span',text: 'SupportSages ?')}
    it { should have_link('LIVE CHAT')}
    it { should have_selector('p',text: 'Server Management')}
    #it { should_not have_selector('div',class:'below_nav_bg')}
  end

  describe "GET /static_pages" do
    before { visit helpdesk_support_path }
    it { should have_content('SERVICE OPTIONS')}
  end
  describe 'career page' do  
    before { visit career_path }
    it { should have_title('Careers Page')}
    it { should have_selector('title',text:'Careers Page') }
    it { should have_selector('p',text:'Current Openings')}
  end

  describe 'contact us page' do
  	before { visit contact_us_path }
  	it { should have_selector('title',text: 'Contact') }
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

  describe 'helpdesk livechat support' do
    before { visit helpdesklivechat_path }

    it { should have_selector('title',text:'Helpdesk livechat')} 
    it { should have_selector('p',text:'Helpdesk Support')}
    it { should have_selector('p',text:'Live Chat')}
    it { should have_content('Hire a Chat Personnel')}
    it { should have_selector('h4',text: 'SERVICE OPTIONS')}
  end

  describe 'helpdesk-tickets' do
    before { visit helpdesk_ticket_path }
    it { should have_title("Helpdesk Support Tickets")}
    it { should have_selector('p', text:'Helpdesk Support')}
    it { should have_selector('p',text: 'Tickets')}
    it { should have_selector('h4',text:'TEAM')}
    it { should have_selector('p',text: 'Monthly Ticket Plan Per Ticket')}
  end
  
  describe 'helpdesktimebound' do
    before { visit helpdesk_timebound_path }
    it { should have_title('Helpdesk Support Time Bound')}
    it { should have_selector('h4',text: 'TEAM')}
    it { should have_selector('p',text:'Helpdesk Support')}
    it { should have_selector('p',text: 'Time Bound')}
    it { should have_selector('p',text: 'Hourly Plans')}
    it { should have_selector('p',text: 'Holiday Plans')}
    it { should have_selector('p',text: 'Night Vigil')}
  end

  describe 'teamplan' do
    before { visit teamplan_path }
    it { should have_title('Helpdesk Team Plans')}
    it { should have_selector('p',text:'Helpdesk Support')}
    it { should have_selector('p',text: 'Team Plans')}
    it { should have_selector('h4',text:'TEAM')}
  end

  describe 'voice-of-customers' do 
    before { visit voice_of_customers_path }
    it { have_title('Voice of Customers')}
    it { should have_selector('h3',text:'Voice of Customers')}
    it { should have_link('Our Philosophy',href:'#')}
  end

  describe 'whysupportsages' do
    before { visit whysupportsages_path }
    it { have_title('Why SupportSages')}
    it { have_selector('h3',text:'12 Reasons to Choose SupportSages')}
    it { have_selector('Our Philosophy',href: '#')}
  end

  describe 'top menu' do
    # before { visit root_path }
    it { have_link('Contact Us',href: contact_us_path)}
    it { have_link('Careers',href: career_path)}
    it { have_link('Specials',href: '#')}
    it { have_link('FAQ',href: '#')}
    it { have_link('My Account',:href => career_path)}
    it { have_link('Home',href: 'root_path')}
    it { have_link('Helpdesk Support',href: helpdesk_support_path)}
    it { have_link('Corporate',href: corporate_path)}
    it { have_link('Team Plans',href: teamplan_path)}
    it { have_link('Why SupportSages',href: '/whysupportsages')}
  end

end
