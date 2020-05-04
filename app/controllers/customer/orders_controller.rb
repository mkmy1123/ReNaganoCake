class Customer::OrdersController < ApplicationController

   def new
      @order = Order.new
      @mailingaddresses = MailingAddress.where(customer_id:[current_customer.id])
   end

   def comfirm
   end

   def create
   end

   def thanks
   end

   def index
   end

   def show
   end

   private
   def order_parms
      params.require(:order).permit(:customer_id, :postcode, :address, :payment_method, :order_status, :postage, :payment)
   end

  end