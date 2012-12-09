require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "Home page" do
    it "should visit root_path before" do
    visit root_path 
    it { should have_selector('h1',    text: 'Fun') }
    it { should have_selector('title', text: full_title('')) }
    it { should_not have_selector 'title', text: '| Home' }
  end
  end

  describe "Help page" do
    it "should visit help_path before" do
    visit help_path
    it { should have_selector('h1',    text: 'Help') }
    it { should have_selector('title', text: full_title('Help')) }
  end
end

  describe "About page" do
    it "should visit about_path before" do
    visit about_path 

    it { should have_selector('h1',    text: 'About') }
    it { should have_selector('title', text: full_title('About Us')) }
  end
end
  describe "Contact page" do
    it "should visit contact_path before" do
    visit contact_path 

    it { should have_selector('h1',    text: 'Contact') }
    it { should have_selector('title', text: full_title('Contact')) }
  end
end
end