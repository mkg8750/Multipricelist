class Service < ApplicationRecord
	has_many :list_price_details ,:class_name => "Service", :foreign_key => "service_pkservice"
end
