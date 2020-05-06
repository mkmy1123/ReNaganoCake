class Admin::OrdersController < ApplicationController

   def index
   	@orders = Order.all
   end

   def show
   	@order = Order.find(params[:id])
   	@order_items = OrderItem.where(order_id:[@order.id])
   end

   def update
   	order = Order.find(params[:id])
   	order.update(order_params)
   	redirect_to order
   end

   private
   def order_params
      params.require(:order).permit(:customer_id, :postcode, :address, :payment_method, :order_status, :postage, :payment)
   end

end
