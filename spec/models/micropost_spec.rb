require 'spec_helper'

describe Micropost do

  before(:each) do
    @user = Factory(:user)
    @attr = { 
      :line0 => "line0", 
      :line1 => "line1", 
      :line2 => "line2" 
    }
  end

  it "should create a new instance given valid attributes" do
    @user.microposts.create!(@attr)
  end

  describe "user associations" do
   
    before(:each) do
      @micropost = @user.microposts.create(@attr)
    end
    
    it "should have a user attribute" do
      @micropost.should respond_to(:user)
    end
    
    it "should have the right associated user" do
      @micropost.user_id.should == @user.id
      @micropost.user.should == @user
    end
  end

  describe "validations" do
    
    it "should require a user id" do
      Micropost.new(@attr).should_not be_valid
    end

    it "should require nonblank line0" do
      @attr[:line0] = "   "
      @user.microposts.build(@attr).should_not be_valid
    end

    it "should require nonblank line1" do
      @attr[:line1] = "  "
      @user.microposts.build(@attr).should_not be_valid
    end

    it "should require nonblank line2" do
      @attr[:line2] = "     "
      @user.microposts.build(@attr).should_not be_valid
    end
  end

  describe "from_user_followed_by" do
    before(:each) do
      @other_user = Factory(:user, :email => Factory.next(:email))
      @third_user = Factory(:user, :email => Factory.next(:email))
      
      @user_post = @user.microposts.create!(@attr)
      @other_post = @other_user.microposts.create!(@attr)
      @third_post = @third_user.
        microposts.create!(@attr)
      
      @user.follow!(@other_user)
    end

    it "should have a from_users_followed_by class method" do
      Micropost.should respond_to(:from_users_followed_by)
    end

    it "should include the followed user's microposts" do
      Micropost.from_users_followed_by(@user).should include(@other_post)
    end

    it "should include the user's own microposts" do
      Micropost.from_users_followed_by(@user).should include(@user_post)
    end

    it "should not include an unfollowed user's microposts" do
      Micropost.from_users_followed_by(@user).should_not include(@third_post)
    end
  end
end
