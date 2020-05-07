class Admin::OrdersController < ApplicationController

   def index
      if params[:customer_id]
         @orders = Order.where(customer_id: params[:customer_id])
      elsif params[:created_at]
         @orders = Order.created_today
      else
         @orders = Order.all
      end
   end

   def show
   	@order = Order.find(params[:id])
   	@order_items = OrderItem.where(order_id:[@order.id])
   end

   def update
   	order = Order.find(params[:id])
      order.update(order_params)
      redirect_to request.referrer
   end

   private
   def order_params
      params.require(:order).permit(:customer_id, :postcode, :address, :payment_method, :order_status, :postage, :payment)
   end

end
