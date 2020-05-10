class Customer::MailingAddressesController < ApplicationController

	def index
		@mailing_addresses = MailingAddress.where(customer_id:[current_customer.id])
		@mailing_address = MailingAddress.new
	end

	def edit
		@mailing_address = MailingAddress.find(params[:id])
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
		end
	end

	def update
		mailing_address = MailingAddress.find(params[:id])
		mailing_address.update(mailing_params)
		redirect_to '/mailing_addresses'
	end

	private
	def mailing_params
		params.require(:mailing_address).permit(:customer_id, :postcode, :address, :name)
	end
end
