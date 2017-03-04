class Category < ApplicationRecord
	has_many :list_price_details ,:class_name => "Category", :foreign_key => "category_pkcategory"
end
