class AddPhoneNumberToCustomer < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :phone_number, :integer
  end
end
