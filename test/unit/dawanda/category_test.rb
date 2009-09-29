require File.dirname(__FILE__) + '/../../test_helper'

module Dawanda
  class ShopTest < Test::Unit::TestCase

    context "The Category class" do

      should "be able to find a category by :id" do
        id  = 5327518
        # response = mock_request_cycle :for => "/category/#{id}", :data => 'getCategoryDetails'

        # Shop.expects(:new).with(response.result).returns('shop')
        # Category.expects(:find_by_user_id).with(user_id, {}).returns('category')
        # 
        # Category.find_by_user_id(user_id, {}).should == 'category'
      end

    end
  end
end