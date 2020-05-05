class Customer::HomeController < ApplicationController

    def top
      @items = Item.all
      @cart_items = CartItem.all
    end

    def about
    end
end
