module Dawanda
  
  # = User
  #
  # Represents a single Dawanda category - has the following attributes:
  #
  # [id] The unique identifier for this category
  # [parent_id] This category's parent id
  # [name] This category's name 
  # [product_count] The amount of products in this category
  #
  class Category
    
    include Dawanda::Model
    
    finder :one, '/categories/:category_id'
    
    attributes :id, :parent_id, :name, :product_count
    
    def products
      Product.find_all_by_category_id(id)
    end
    
  end
end