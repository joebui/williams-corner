class OrderItemsController < ApplicationController
  def index
    @status = ['pending','in process','delivered']
    @income = 0;
    @url = request.original_fullpath
    @name = @url.split('/').last
    if logged_in? && current_user.is_admin == true
      if params[:search]
        #@genres = Genre.all.pluck(:name)
        @order_items = OrderItem.search(params[:search], params[:type])
      else
        #@genres = Genre.all.pluck(:name)
        @order_items = OrderItem.all
      end
    else
      redirect_to root_url
    end
  end
  
  def report
    @order_items = OrderItem.where("tran_date >= :start_date AND tran_date <= :end_date",
    {start_date: params[:start_date], end_date: params[:end_date]})
    @total = 0
    @order_items.each do |item|
      @total = @total + item.total_price
    end
  end

  def update                
      @order_item = OrderItem.find(params[:id])            
      @order_item.update_attributes(order_item_params)
      redirect_to order_items_path    

      # send email to confirm delivered product
      prod = Product.find_by_id(order_item.product_id)      
      current_user.send_check_out_email(prod.name)
      redirect_to homepage_cart_path
  end

  def destroy
    @order_item = OrderItem.find(params[:id])
    @order_item.destroy
    if @order_item.status == 'pending'
      redirect_to homepage_cart_path
    else
      redirect_to order_items_path
    end
  end
  
  def create
    #@article = Article.find(params[:article_id])
    @current_order = current_user.order_items.create(order_item_params)
    @current_order.save
    redirect_to homepage_cart_path
  end
 
  private
    def order_item_params
      params.require(:order_item).permit(:owner_id, :quantity, :product_id, :status, :discount, :hide, :tran_date)
    end
end
