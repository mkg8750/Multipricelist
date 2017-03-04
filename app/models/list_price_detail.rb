class ListPriceDetail < ApplicationRecord
  belongs_to :service ,:class_name => "Service", :foreign_key => "service_pkservice"
  belongs_to :category,:class_name => "Category", :foreign_key => "category_pkcategory"
  belongs_to :list_price,:class_name => "ListPrice", :foreign_key => "list_price_pklist"
end
