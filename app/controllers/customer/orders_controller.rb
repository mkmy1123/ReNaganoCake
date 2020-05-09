class Customer::OrdersController < ApplicationController

   def new
      @cart_items = CartItem.where(customer_id:[current_customer.id])
      @order = Order.new
      @mailingaddresses = MailingAddress.where(customer_id:[current_customer.id])
   end

   def confirm
      @cart_items = CartItem.where(customer_id:[current_customer.id])
      @order = Order.new
      @postage = 800
   end

   def create
      @cart_items = CartItem.where(customer_id:[current_customer.id])
      @order = Order.new(order_params)
      @postage = 800
      if params[:page] == "new"
            render 'confirm'
      else
         if @order.payment_method == "クレジットカード"
            @order.order_status = 1
         end
         @order.save
         @cart_items.each do |cart_item|
            OrderItem.create!(order_id: @order.id, count:cart_item.count, item_id:cart_item.item_id, price:cart_item.item.price)
         end
         @cart_items.destroy_all
         redirect_to '/thanks'
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