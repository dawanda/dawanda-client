module Dawanda
  
  # = User
  #
  # Represents a single Dawanda user - has the following attributes:
  #
  # [id] The unique identifier for this user
  # [username] This user's username
  # [url] The full URL to this user's profile page / shop (if seller)
  # [city] The user's city / state (optional)
  # [gender] The user's gender
  # [bio] User's biography
  #
  class User
    
    include Dawanda::Model
    
    finder :one, '/users/:user_id'
    
    # attribute :last_login, :from => :last_login_epoch

    attributes :id, :name, :url, :city, :sex, :bio, :transaction_sold_count, :is_seller, :images
    
    # This user's shop, returns nil if user is not a seller. See Dawanda::Shop
    # for more information.
    #
    def shop
      Shop.find_by_user_id(id) if seller?
    end
    
    # Is this user a seller?
    #
    def seller?
      is_seller
    end
    
    def image_40x40
      images.first['image_40x40']
    end
    
    def image_80x80
      images.first['image_80x80']
    end
    
    def image_170x
      images.first['image_170x']
    end
    
  end
end