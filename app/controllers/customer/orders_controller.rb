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
      @cart_items = CartItem.where(customer_id:[current_customer.id])
      if @order.save
         @cart_items.each do |cart_item|
           OrderItem.create!(order_id: @order.id, count:cart_item.count, item_id:cart_item.item_id, price:cart_item.item.price)
         end
         @cart_items.destroy_all
         redirect_to '/thanks'
      else
         render 'confirm'
      end
   end

   def thanks
   end

   def index
      @orders = Order.where(customer_id:[current_customer.id])
   end

   def show
      @order = Order.find(params[:id])
      @order_items = OrderItem.where(order_id: @order.id)
   end

   private
   def order_params
      params.require(:order).permit(:customer_id, :postcode, :address, :payment_method, :order_status, :postage, :payment)
   end

  end