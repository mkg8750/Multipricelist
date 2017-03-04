class ListPrice < ApplicationRecord
	has_many :list_price_details ,:class_name => "ListPriceDetail", :foreign_key => "list_price_pklist"
end
