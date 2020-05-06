class Customer::ItemsController < ApplicationController
    def show
      @item = Item.find(params[:id])
      @cart_item = CartItem.new
      @cart_items = CartItem.where(customer_id:[current_customer.id])
    end

    def index
      if params[:genre_id]
        @items = Item.where(genre_id: params[:genre_id])
        @genre = Genre.find(params[:genre_id])
      else
        @items = Item.all
      end
      @cart_items = CartItem.where(customer_id:[current_customer.id])
    end

end
