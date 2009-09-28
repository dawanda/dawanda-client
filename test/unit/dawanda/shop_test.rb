require File.dirname(__FILE__) + '/../../test_helper'

module Dawanda
  class ShopTest < Test::Unit::TestCase

    context "The Shop class" do

      should "be able to find a shop by :user_id" do
        user_id  = 5327518
        response = mock_request_cycle :for => "/shops/#{user_id}", :data => 'getShopDetails'

        # Shop.expects(:new).with(response.result).returns('shop')
        Shop.expects(:find_by_user_id).with(user_id, {}).returns('shop')

        Shop.find_by_user_id(user_id, {}).should == 'shop'
      end

    end

    context "An instance of the Shop class" do

      when_populating Shop, :from => 'getShopDetails' do

        value_for :name,              :is => 'littletjane'
        value_for :banner_image_url,  :is => "http://img.dawanda.com/Shop/806/806038/full/5874999.jpg"
        value_for :updated,        :is => 1239717723.36
        value_for :created,        :is => 1237430331.15

      end
      
      should "know the creation date" do
        shop = Shop.new
        shop.stubs(:created_at).with().returns(Time.at(1237430331.15))
        
        shop.created_at.should == Time.at(1237430331.15)
      end
      
      should "know the update date" do
        shop = Shop.new
        shop.stubs(:updated_at).with().returns(Time.at(1239717723.36))
        
        shop.updated_at.should == Time.at(1239717723.36)
      end
      
      should "have a collection of products" do
        user_id = '123'
        
        shop = Shop.new
        shop.expects(:user_id).with().returns(user_id)
        
        Product.expects(:find_all_by_shop_id).with(user_id, {}).returns('products')
        
        shop.products.should == 'products'
      end

    end

  end
end