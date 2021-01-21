class ChangeDateCustomerTelno < ActiveRecord::Migration[5.2]
  def change
      change_column :customers, :telno, :string
  end
end
