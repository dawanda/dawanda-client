module Dawanda
  
  # = Shop
  #
  # Represents a single Dawanda shop.  Users may or may not have an associated shop - 
  # check the result of User#seller? to find out.
  #
  # A shop has the following attributes:
  #
  # [name] The shop's name
  # [title] A brief heading for the shop's main page
  # [announcement] An announcement to buyers (displays on the shop's home page)
  # [message] The message sent to users who buy from this shop
  # [banner_image_url] The full URL to the shops's banner image
  # [listing_count] The total number of active listings contained in this shop
  #
  class Shop
    
    include Dawanda::Model

    finder :one, '/shops/:user_id'
    
    attribute :updated, :from => :updated_at
    attribute :created, :from => :created_at

    attributes :banner_image_url, :listing_count, :title, :announcement, :user_id, :name
   
    # Time that this shop was created
    #
    def created_at
      Time.parse(created)
    end
    
    # Time that this shop was last updated
    #
    def updated_at
      Time.parse(updated)
    end
    
    # A collection of listings in this user's shop. See Dawanda::Listing for
    # more information
    #
    def products
      Product.find_all_by_user_id(user_id)
    end
    
  end
end