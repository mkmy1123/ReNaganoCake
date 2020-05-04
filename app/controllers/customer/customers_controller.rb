class Customer::CustomersController < ApplicationController

	def show
		@customer = Customer.find(params[:id])
	end

	def edit
		@customer = Customer.find(params[:id])
	end

	def update
		@customer = Customer.find(params[:id])
		if @customer.update(customer_params)
			redirect_to customer_path(current_customer)
		else
			render "edit"
		end
	end

	def quit
		@customer = current_customer
	end

	def invalid
		@customer = Customer.find(params[:id])
		@customer.update(customer_params)
		reset_session
		redirect_to root_path
	end

	private
	def customer_params
		params.require(:customer).permit(:first_name, :last_name, :kana_first_name, :kana_last_name, :email, :postcode, :address, :phone_number, :is_valid)
	end
end
