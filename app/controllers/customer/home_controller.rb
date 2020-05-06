class Customer::HomeController < ApplicationController

    def top
      @items = Item.all
      if customer_signed_in?
        @cart_items = CartItem.where(customer_id:[current_customer.id])
      end
    end

    def about
    end
end
