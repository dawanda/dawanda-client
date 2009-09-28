require File.dirname(__FILE__) + '/../test_helper'

class DawandaTest < Test::Unit::TestCase

  context "The Dawanda module" do
    
    should "be able to set and retrieve the API key" do
      Dawanda.api_key = 'key'
      Dawanda.api_key.should == 'key'
    end
    
    should "be able to find a user by username" do
      user = stub()
      
      Dawanda::User.expects(:find_by_user_id).with('littletjane').returns(user)
      Dawanda.user('littletjane').should == user
    end
    
  end

end