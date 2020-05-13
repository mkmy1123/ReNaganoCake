class Customer::MailingAddressesController < ApplicationController

	before_action :authenticate_customer!

	def index
		@mailing_addresses = MailingAddress.where(customer_id:[current_customer.id])
		@mailing_address = MailingAddress.new
	end

	def edit
		@mailing_address = MailingAddress.find(params[:id])
		if @mailing_address.customer_id != current_customer.id
			redirect_to root_path
		end
	end

	def destroy
		mailing_address = MailingAddress.find(params[:id])
		mailing_address.destroy
		redirect_to '/mailing_addresses'
	end

	def create
		mailing_address = MailingAddress.new(mailing_params)
		if mailing_address.save
			redirect_to '/mailing_addresses'
		else
			flash[:notice] = "項目を正しく記入してください"
			redirect_to request.referrer
		end
	end

	def update
		mailing_address = MailingAddress.find(params[:id])
		if mailing_address.update(mailing_params)
			redirect_to '/mailing_addresses'
		else
			flash[:notice] = "項目を正しく記入してください"
			redirect_to request.referrer
		end
	end

	private
	def mailing_params
		params.require(:mailing_address).permit(:customer_id, :postcode, :address, :name)
	end
end
