class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    # @items = Item.order("created_at DESC")
  end

  def create
     @item = Item.new(item_params)
      if @item.save
        redirect_to root_path
      else
        render :new, status: :unprocessable_entity
      end
  end
  
    
  def new
    @item = Item.new
  end


  private
  def item_params
    params.require(:item).permit(:image, :item_name, :product_description, :category_id, :product_condition_id, :shipping_fee_burden_id, :shipping_region_id, :days_until_shipping_id, :price).merge(user_id: current_user.id)
  end

end


