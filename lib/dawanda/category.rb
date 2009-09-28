module Dawanda
  
  # = Category
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
    
    finder :all, '/categories/:name'
    finder :all, '/categories/:parent_id/children'
    finder :one, '/categories/:id'
    
    attributes :id, :parent_id, :name, :product_count
    
    def products(params = {})
      @products ||= Product.find_all_by_category_id(id, params)
    end
    
    def self.top(params = {})
      # This is a hack, because dynamic finder generation takes at least
      # one placeholder like ":name"
      self.find_all_by_name('top', params)
    end
    
    def children(params = {})
      Category.find_all_by_parent_id(id, params)
    end
    
  end
end