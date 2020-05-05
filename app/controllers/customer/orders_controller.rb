class Customer::OrdersController < ApplicationController

   def new
      @order = Order.new
      @mailingaddresses = MailingAddress.where(customer_id:[current_customer.id])
   end

   def confirm
      @cart_items = CartItem.where(customer_id:[current_customer.id])
      @postage = 800
      @order = Order.new
   end

   def create
      @order = Order.new(order_params)
      if @order.save
         redirect_to '/orders'
      end
   end

   def thanks
   end

   def index
      @orders = Order.where(customer_id:[current_customer.id])
   end

   def show
   end

   private
   def order_params
      params.require(:order).permit(:customer_id, :postcode, :address, :payment_method, :order_status, :postage, :payment)
   end

  end