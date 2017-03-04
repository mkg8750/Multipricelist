class ListPricesController < ApplicationController
	
	def index
    @q = ListPrice.ransack(params[:q])
  	@listPrices = @q.result.paginate(:page => params[:page], :per_page => 10)
    
  end
  ##-----------  CREATE NEW PRICE LIST------------
  def new
    @categories = Category.all
    @services = Service.all
  end

  ###--------------------  CREATE NEW PRICE LIST --------------------
  def create
    @list_price = ListPrice.new(lis_description:params[:price][:list_description],lis_default_mark: params[:price][:lis_default_mark])

    @list_price.save()

    params[:price_list].each do |ser, cat|


    
      cat.each do |cats, price|
        ListPriceDetail.create(category_id:cats, service_id:ser,list_price_id: @list_price.id, listprice: price)
      end
    end
    flash[:success] = "List Price created Successfully."
    redirect_to root_path  
  end

 ##--------------  UPDATE EXISTING PRICE LIST DETAILS -----------
  def edit
    @array = []
    @category_array = Category.all
    @list = ListPrice.find_by(pklist:params[:pklist])
    listpricedetails = @list.list_price_details.includes(:service,:category)
  	service_array = listpricedetails.each.map(&:service_id).uniq
    category_array = listpricedetails.each.map(&:category_id).uniq

    service_array.each do |service|
      @price = {}
      servicelists = listpricedetails.where(service_id:service, list_price_id:@list.id).first
      category_array.each do |cats|

            lists = listpricedetails.where(service_id:service,category:cats)
            lists.each do |list|
               @price[cats] = list.listprice
            end

      end
      @array.append({{service => servicelists.service.ser_description}=> @price})
    end

  end
  def update
    @list_price = ListPrice.find_by(pklist:params[:pklist])
    @list_price.update_attributes(lis_description: params[:price][:lis_description], lis_default_mark: params[:lis_default_mark])
    params[:list_price].each do |ser, cat|
      cat.each do |cats, price|
        if price.present?
          ListPriceDetail.find_by(service_id: ser,category_id: cats, list_price_id:@list_price.id).update(listprice: price)
        end
      end
    end
    flash[:success] = "List Price Updated Successfully."
    redirect_to root_path 
    
  end

###------------------  DESTROY THE EXISTING PRICE LIST
  def destroy
    # binding.pry
     @list_price = ListPrice.find_by(pklist:params[:pklist])
     @list_price.delete
     flash[:success] = "List Price Removed Successfully."
     redirect_to root_path
  end
end
