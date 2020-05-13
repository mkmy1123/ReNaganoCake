class Admin::OrderItemsController < ApplicationController
before_action :authenticate_admin!

	def update
		order_item = OrderItem.find(params[:id])
		order = order_item.order
		if params[:order_item][:create_status] == "製作中"
			order.update!(order_status: 2)
		elsif params[:order_item][:create_status] == "製作完了"
			order.update!(order_status: 3)
		else
			order_item.updatea(order_item_params)
		end
			redirect_to request.referrer
	end

	private
		def order_item_params
			params.require(:order_item).permit(:create_status)
		end
end
