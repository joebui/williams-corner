class OrderItemsController < ApplicationController
  def index
    @status = ['pending','in process','delivered']
    @url = request.original_fullpath
    @name = @url.split('/').last
    if logged_in? && current_user.name == "admin"
      if params[:search]
        #@genres = Genre.all.pluck(:name)
        @order_items = OrderItem.search(params[:search])
      else
        #@genres = Genre.all.pluck(:name)
        @order_items = OrderItem.all
      end
    else
      redirect_to root_url
    end
  end
  
  def update                
      @order_item = OrderItem.find(params[:id])            
      @order_item.update_attributes(order_item_params)
      redirect_to order_items_path    
  end

  def destroy    
      @order_item = current_user.order_items.find(params[:id])
      @order_item.destroy
      redirect_to homepage_history_path    
  end
  
  def create
    #@article = Article.find(params[:article_id])
    @current_order = current_user.order_items.create(order_item_params)
    @current_order.save
    redirect_to homepage_cart_path
  end
 
  private
    def order_item_params
      params.require(:order_item).permit(:owner_id, :quantity, :product_id, :status)
    end
end
