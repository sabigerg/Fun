require 'spec_helper'

describe "students/show" do
  before(:each) do
    @student = assign(:student, stub_model(Student,
      :firstname => "Firstname",
      :lastname => "Lastname",
      :nationality => "Nationality",
      :email => "Email",
      :username => "Username"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Firstname/)
    rendered.should match(/Lastname/)
    rendered.should match(/Nationality/)
    rendered.should match(/Email/)
    rendered.should match(/Username/)
  end
end
