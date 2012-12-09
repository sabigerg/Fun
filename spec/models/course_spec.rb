require 'spec_helper'

describe Course do
 
 before(:each) do
   
end

it "should have the correct associations" do
  should belong_to(:professor)
  should belong_to(:schedule)
  shoudld have_many(:schedules)
  should have_many(:students).through(:schedule)
end

it "should validate the presence of professor_id" do
  should validate_presence_of :professor_id
end

it "should validate the presnece of name" do
  should validate_presence_of :name
end

it "should validate the presnece of number" do
  should validate_presence_of :number
end

it "should validate the numericality of number" do
  should validate_numericality_of(:number)
end

it "should create valid course factories" do
  @course1.shoudl be_valid
end
end
