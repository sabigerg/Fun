require 'spec_helper'

describe "students/index" do
  before(:each) do
    assign(:students, [
      stub_model(Student,
        :firstname => "Firstname",
        :lastname => "Lastname",
        :nationality => "Nationality",
        :email => "Email",
        :username => "Username"
      ),
      stub_model(Student,
        :firstname => "Firstname",
        :lastname => "Lastname",
        :nationality => "Nationality",
        :email => "Email",
        :username => "Username"
      )
    ])
  end

  it "renders a list of students" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Firstname".to_s, :count => 2
    assert_select "tr>td", :text => "Lastname".to_s, :count => 2
    assert_select "tr>td", :text => "Nationality".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Username".to_s, :count => 2
  end
end
