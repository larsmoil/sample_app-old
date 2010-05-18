require 'spec_helper'

describe "Sessions" do
  describe "log in/out" do
    it "should be able to log in, out then in again" do
      user = Factory(:user)
      integration_sign_in(user)
      controller.should be_signed_in
      click_link "Sign out"
      controller.should_not be_signed_in
      integration_sign_in(user)
      controller.should be_signed_in
    end
  end
end