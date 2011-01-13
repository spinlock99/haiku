require 'spec_helper'

describe "Microposts" do
  before(:each) do
    user = Factory(:user)
    visit signin_path
    fill_in :email, :with => user.email
    fill_in :password, :with => user.password
    click_button
  end

  describe "creation" do
    
    describe "failure" do
      
      it "should not make a new micropost" do
        lambda do
          visit root_path
          fill_in :micropost_line0, :with => ""
          fill_in :micropost_line1, :with => ""
          fill_in :micropost_line2, :with => ""
          click_button
          response.should render_template('pages/home')
          response.should have_selector("div#error_explanation")
        end.should_not change(Micropost, :count)
      end
    end

    describe "success" do

      it "should make a new micropost" do
        @attr = {
          :line0 => "line0",
          :line1 => "line1",
          :line2 => "line2"
        }
        lambda do
          visit root_path
          fill_in :micropost_line0, :with => @attr[:line0]
          fill_in :micropost_line1, :with => @attr[:line1]
          fill_in :micropost_line2, :with => @attr[:line2]
          click_button
          response.should have_selector("span.line0", 
                                        :content => @attr[:line0])
        end.should change(Micropost, :count).by(1)
      end
    end
  end

end
