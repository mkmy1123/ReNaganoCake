class Customer::OrdersController < ApplicationController
  before_action :order_is_valid, only: [:new, :confirm, :create]
  before_action :authenticate_customer!

  def new
    @cart_items = CartItem.where(customer_id: [current_customer.id])
    @order = Order.new
    @mailingaddresses = MailingAddress.where(customer_id: [current_customer.id])
  end

  def confirm
    @cart_items = CartItem.where(customer_id: [current_customer.id])
    @order = params[:order][:order]
  end

  def create
    @cart_items = CartItem.where(customer_id: [current_customer.id])
    @order = Order.new(order_params)
    @order.postage = 800
    if params[:page] == "new"
      case @order.address
      when "mailing_address"
        session[:address] = params[:order][:mailing_address]
        session[:payment_method] = params[:order][:payment_method]
      when "new_address"
        session[:address] = "〒#{params[:order][:new_postcode]} #{params[:order][:new_address]} #{params[:order][:new_name]}"
        session[:session] = params[:order][:payment_method]
      else
        session[:address] = params[:order][:address]
        session[:payment_method] = params[:order][:payment_method]
      end
      render 'confirm'
    else
      @order.address = session[:address]
      @order.payment_method = session[:payment_method]
      @order.order_status = 1 if @order.payment_method == "クレジットカード"
      if @order.save
        @cart_items.each do |cart_item|
          OrderItem.create!(
            order_id: @order.id,
            count: cart_item.count,
            item_id: cart_item.item_id, price: cart_item.item.price
          )
        end
        @cart_items.destroy_all
        redirect_to '/thanks'
      else
        flash[:alert] = "項目に不備があります"
        redirect_to '/orders/new'
      end
    end
  end

  def thanks
  end

  def index
    @orders = Order.where(customer_id: [current_customer.id])
  end

  def show
    @order = Order.find(params[:id])
    if @order.customer_id != current_customer.id
      redirect_to root_path
    end
    @order_items = OrderItem.where(order_id: @order.id)
  end

  private

  def order_params
    params.require(:order).permit(
      :customer_id, :address, :m_address,
      :payment_method, :order_status, :postage, :payment
    )
  end

  def order_is_valid
    @cart_items = CartItem.where(customer_id: [current_customer.id])
    if @cart_items.present? == false
      redirect_to root_path
    end
  end
end
