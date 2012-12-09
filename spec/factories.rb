FactoryGirl.define do
  
  factory :student do
    firstname "Shamma"
    lastname "Al Hetmi"
    email "shamma.alhetmi@gmail.com"
    username "shamma123"
    dateofbirth  "13-05-1992"
    nationality "Qatar"
    password "foobar" 
    password_confirmation "foobar"
    end
  
    factory :course do
      name "Physics"
      number 3
      association :professor 
    end

    factory :schedule do
      association :course
      association :student
    end

end