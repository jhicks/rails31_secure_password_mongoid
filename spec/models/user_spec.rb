require 'spec_helper'

describe User do
  describe "create" do
    it "should create a new user given valid attributes" do
      User.create!(:email => 'joe@test.com',:password => 'password123',:password_confirmation => 'password123')
    end

    it "should require password" do
      user = User.new(:email => 'joe@test.com')
      user.should_not be_valid
    end

    it "should require password confirmation" do
      user = User.new(:email => 'joe@test.com',:password => 'password123')
      user.should_not be_valid
    end
  end

  describe "change password" do
    before(:each) do
      @user = User.create!(:email => 'joe@test.com',:password => 'password123',:password_confirmation => 'password123')
    end

    it "should change password given valid attributes" do
      @user.password = 'abc123'
      @user.password_confirmation = 'abc123'
      @user.save!
    end

    it "should require password confirmation" do
      @user.password = 'abc123'
      @user.should_not be_valid
    end
  end
end
