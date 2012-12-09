require 'spec_helper'

describe "students/edit" do
  before(:each) do
    @student = assign(:student, stub_model(Student,
      :firstname => "MyString",
      :lastname => "MyString",
      :nationality => "MyString",
      :email => "MyString",
      :username => "MyString"
    ))
  end

  it "renders the edit student form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => students_path(@student), :method => "post" do
      assert_select "input#student_firstname", :name => "student[firstname]"
      assert_select "input#student_lastname", :name => "student[lastname]"
      assert_select "select#student_nationality", :name => "student[nationality]"
      assert_select "input#student_email", :name => "student[email]"
      assert_select "input#student_username", :name => "student[username]"
    end
  end
end
