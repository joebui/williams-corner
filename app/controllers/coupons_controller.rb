class CouponsController < ApplicationController
  def index    
    if logged_in? && current_user.name == "admin"
      @coupons = Coupon.all
    else
      redirect_to login_path
    end
  end
  
  def create
    random_string = Random.new_seed;
    @coupon = Coupon.new;
    @coupon.code = random_string;
    @coupon.date = Time.now.strftime("%Y-%m-%d");
    
    @accounts = Account.all
    @accounts.each do |account|
      account.send_coupon_code(@coupon.code)
    end

    if @coupon.save
      redirect_to coupons_path
    end
  end

  
  def new
    @coupon = Coupon.new
  end
  
  def show
    @coupon = Coupon.find(params[:id])
  end

  def destroy
    @coupon = Coupon.find(params[:id])
    @coupon.destroy
    redirect_to coupons_path
  end
  
end
