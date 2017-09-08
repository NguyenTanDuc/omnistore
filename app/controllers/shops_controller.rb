class ShopsController < ApplicationController
  def index
    @shops = current_user.shops
  end

  def new
    @shop = current_user.shops.new
  end

  def create
    @shop = current_user.shops.create shop_params
    if @shop.persisted?
      flash[:success] = t ".success"
      redirect_to shops_path
    else
      flash[:alert] = t ".error"
      render :new
    end
  end

  def set_current_shop
    cookies["current_shop_user_#{current_user.id}"] = params[:shop_id]
    redirect_to request.referer
  end

  private
  def shop_params
    params.require(:shop).permit :name
  end
end
