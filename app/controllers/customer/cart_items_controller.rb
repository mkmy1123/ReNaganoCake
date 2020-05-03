class Customer::CartItemsController < ApplicationController

	def index
		@customer = current_customer
		@cart_items = @customer.cart_items.all
	end

	def destroy
	end

	def update
	end

	def destroy_all
	end

	def create
	end

end
