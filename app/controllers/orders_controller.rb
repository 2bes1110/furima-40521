class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :item_order_status, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @ordershared = OrderShared.new
    if current_user == @item.user
      redirect_to root_path
    end
  end

  def create
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @ordershared = OrderShared.new(order_shared_params)
    @ordershared.user_id = current_user.id
    @ordershared.item_id = params[:item_id].to_i
    if @ordershared.valid?
      pay_item
      @ordershared.save
      redirect_to root_path and return
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def item_order_status
    if current_user.id != @item.user_id && @item.order.present?
      redirect_to root_path and return
    end
  end

  def order_shared_params
    params.require(:order_shared).permit(:postcode, :shipping_region_id, :municipalities, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token:params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
        amount: @item.price,
        card: params[:token],
        currency: 'jpy'
      )
  end
end