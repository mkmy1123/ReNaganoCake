class Customer::ItemsController < ApplicationController
    def show
      @item = Item.find(params[:id])
      @cart_item = CartItem.new
      @cart_items = CartItem.where(customer_id:[current_customer.id])

    end

    def index
      @items = Item.all
      @cart_items = CartItem.where(customer_id:[current_customer.id])
    end

end
