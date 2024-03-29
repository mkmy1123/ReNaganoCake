class Customer::ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    if customer_signed_in?
      @cart_items = CartItem.where(customer_id: [current_customer.id])
      if @cart_items.pluck(:item_id).include?(@item.id)
        @cart_item = CartItem.find_by(item_id: @item.id, customer_id: current_customer.id)
      end
    end
  end

  def index
    if params[:genre_id]
      @items = Item.where(genre_id: params[:genre_id], is_selling: true)
      @index_items = @items.order(:updated_at).page(params[:page])
      @genre = Genre.find(params[:genre_id])
    elsif params[:name].present?
      @items = Item.where("name LIKE ?", "#{params[:name]}%")
      @index_items = @items.order(:updated_at).page(params[:page])
    else
      @items = Item.where(is_selling: true)
      @index_items = @items.order(:updated_at).page(params[:page])
    end
    if customer_signed_in?
      @cart_items = CartItem.where(customer_id: [current_customer.id])
    end
  end
end
