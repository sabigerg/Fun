require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "signin page" do
    it "should visit sign_path before" do
    visit signin_path 

    it { should have_selector('h1',    text: 'Sign in') }
    it { should have_selector('title', text: 'Sign in') }
  end
end

  describe "signin" do

    it "should visit signin_path before" do
      visit signin_path 

      describe "with invalid information" do
        before { click_button "Sign in" }

        it { should have_selector('title', text: 'Sign in') }
        it { should have_selector('div.alert.alert-error', text: 'Invalid') }

        describe "after visiting another page" do
          before { click_link "Home" }
          it { should_not have_selector('div.alert.alert-error') }
        end
      end
    end
     describe "with valid information" do
          let(:student) { FactoryGirl.create(:student) }
          before do
            fill_in "Email",    with: student.email
            fill_in "Password", with: student.password
            click_button "Sign in"
          end

          it { should have_selector('title', text: student.name) }
          it { should have_link('Profile', href: student_path(student)) }
          it { should have_link('Sign out', href: signout_path) }
          it { should_not have_link('Sign in', href: signin_path) }
          
          describe "followed by signout" do
                  before { click_link "Sign out" }
                  it { should have_link('Sign in') }
                end
        end
      end
    end