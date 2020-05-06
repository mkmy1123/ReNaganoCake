class Customer::HomeController < ApplicationController

    def top
      @items = Item.all
      @cart_items = CartItem.where(customer_id:[current_customer.id])
    end

    def about
    end
end
