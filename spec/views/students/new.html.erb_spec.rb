require 'spec_helper'

describe "students/new" do
  before(:each) do
    assign(:student, stub_model(Student,
      :firstname => "MyString",
      :lastname => "MyString",
      :nationality => "MyString",
      :email => "MyString",
      :username => "MyString"
    ).as_new_record)
  end

  it "renders new student form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => students_path, :method => "post" do
      assert_select "input#student_firstname", :name => "student[firstname]"
      assert_select "input#student_lastname", :name => "student[lastname]"
      assert_select "select#student_nationality", :name => "student[nationality]"
      assert_select "input#student_email", :name => "student[email]"
      assert_select "input#student_username", :name => "student[username]"
    end
  end
end
