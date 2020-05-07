class Customer::ItemsController < ApplicationController
    def show
      @item = Item.find(params[:id])
      @cart_item = CartItem.new
      if customer_signed_in?
        @cart_items = CartItem.where(customer_id:[current_customer.id])
      end
    end

    def index
      if params[:genre_id]
        @items = Item.where(genre_id: params[:genre_id])
        @genre = Genre.find(params[:genre_id])
      else
        @items = Item.all
      end
      if customer_signed_in?
        @cart_items = CartItem.where(customer_id:[current_customer.id])
      end
    end
end