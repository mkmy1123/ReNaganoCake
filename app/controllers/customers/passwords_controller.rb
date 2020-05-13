# frozen_string_literal: true

class Customers::PasswordsController < Devise::PasswordsController
def require_no_authentication
end
def assert_reset_token_passed
end
  # GET /resource/password/new
   def new
     super
   end

  # POST /resource/password
  # def create
  #   super
  # end

  # GET /resource/password/edit?reset_password_token=abcdef
  # def edit
  #   super
  # end

   def update
     super
   end

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
end
