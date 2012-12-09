require 'spec_helper'

describe Student do
  
  before do
      @student = Student.new(firstname: "Example User", lastname: "Example User", username: "shamma1234", dateofbirth: "13-05-1992", email: "shamma.alhetmi@gmail.com", nationality: "Qatar", password: "123456", password_confirmation: "123456")
      @student.save!
    end

  describe "when password is not present" do
    before { @student.password = @student.password_confirmation = " " }
    it { should_not be_valid }
  end
  
  describe "when password doesn't match confirmation" do
    before { @student.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end
  
  describe "when password confirmation is nil" do
      before { @student.password_confirmation = nil }
      it { should_not be_valid }
    end
    
    describe "with a password that's too short" do
        before { @student.password = @student.password_confirmation = "a" * 5 }
        it { should be_invalid }
      end

      describe "return value of authenticate method" do
        before { @student.save }
        let(:found_student) { Student.find_by_email(@student.email) }

        describe "with valid password" do
          it { @student.email.should == found_student.authenticate("123456").email }
        end

        describe "with invalid password" do
          let(:student_for_invalid_password) { found_student.authenticate("invalid") }

          it { should_not == student_for_invalid_password }
          specify { student_for_invalid_password.should be_false }
        end
      end
  
      it { should respond_to(:password_confirmation) }
        it { should respond_to(:remember_token) }
  it { should respond_to(:authenticate) }
  
  describe "remember token" do
      before { @student.save }
      it { @student.remember_token.should_not be_blank }
    end
  
  describe "Validation Macros" do
      it {should validate_presence_of(:firstname)}
      it {should validate_presence_of(:lastname)}
      it {should validate_presence_of(:dateofbirth)}
      it {should validate_presence_of(:nationality)}
      it {should validate_presence_of(:username)}
      it {should validate_presence_of(:email)} 
      it {should validate_presence_of(:password_digest)} 
      it {should validate_presence_of(:password)} 
      it {should validate_presence_of(:password_confirmation)} 
      
  end
  
  describe "validates good emails" do
    it {should allow_value("fred@fred.com").for(:email)}
    it {should allow_value("fred@qatar.cmu.edu").for(:email)}
    it {should allow_value("myfred@fred.org").for(:email)}
    it {should allow_value("fred123@fred.gov").for(:email)}
    it {should allow_value("my.fred@fred.net").for(:email)}
  end

  describe "validates bad emails" do
    it {should_not allow_value("fred").for(:email)}
    it {should_not allow_value("fred@qatar,com").for(:email)}
    it {should_not allow_value("fred@fred.uk").for(:email)}
    it {should_not allow_value("my fred123@fred.com").for(:email)}
    it {should_not allow_value("fred@fred.con").for(:email)}
  end
  
  describe "Validates good nationalities" do
    it {should allow_value("Qatar").for(:nationality)}
  end

  describe "Rejects bad nationalities" do
    it {should_not allow_value("bad").for(:nationality)}
  end
  
  describe "Creating Students" do
    before(:each) do
      @shamma = FactoryGirl.create(:student)
      @stefanie = FactoryGirl.create(:student, :firstname => "Stefanie", :lastname => "Abi Jerjes", :username => "stefanie123")
      @umair = FactoryGirl.create(:student, :firstname => "Umair", :lastname => "Ahmed", :email => "umair@gmail.com", :username => "umair123")
    end
    it "All students are valid" do
      @shamma.should be_valid
      @stefanie.should be_valid
      @umair.should be_valid
    end
    it "has the right attribute information" do
        @shamma.firstname.should == "Shamma"
        @stefanie.firstname.should == "Stefanie"
        @umair.firstname.should == "Umair"
      end
  end
  
end
