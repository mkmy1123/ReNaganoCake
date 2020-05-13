class RemovePostcodeFromOrder < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :postcode, :string
  end
end
