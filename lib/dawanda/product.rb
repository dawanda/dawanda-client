module Dawanda
  
  # = Listing
  #
  # Represents a single Dawanda product.  Has the following attributes:
  #
  # [id] The unique identifier for this listing
  # [title] The title of this listing
  # [description] This listing's full description
  # [view_count] The number of times this listing has been viewed
  # [url] The full URL to this listing's detail page
  # [price] The price of this listing item
  # [currency] The currency that the seller is using for this listing item
  # [quantity] The number of items available for sale
  # [tags] An array of tags that the seller has used for this listing
  # [materials] Any array of materials that was used in the production of this item
  #
  # Additionally, the following queries on this item are available:
  #
  # [active?] Is this listing active?
  # [removed?] Has this listing been removed?
  # [sold_out?] Is this listing sold out?
  # [expired?] Has this listing expired?
  # [alchemy?] Is this listing an Alchemy item? (i.e. requested by an Dawanda user)
  #
  class Product
    
    include Dawanda::Model
    
    finder :all, '/shops/:shop_id/products'
    finder :all, '/categories/:category_id/products'
    
    
    finder :one, '/products/:product_id'
    
    attribute :created, :from => :created_at
    
    attributes :id, :name, :description, :created_at, :view_count, :tags,
               :ending, :quantity, :materials, :price, :restful_path, :product_url, :images

 
    # Time that this listing was created
    #
    def created_at
      Time.parse(created)
    end
    
    # Time that this listing is ending (will be removed from store)
    #
    def ending_at
      Time.parse(ending)
    end
    
    # The primary image for this listing.  See Dawanda::Image for more
    # information
    #
    def image_25x25
      images.first['image_25x25']
    end
    
  end
end
