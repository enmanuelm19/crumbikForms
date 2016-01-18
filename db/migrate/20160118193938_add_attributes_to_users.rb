class AddAttributesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :lastname, :string
    add_column :users, :birthdate, :date
    add_column :users, :sex, :string
    add_column :users, :phone_number, :string
  end
end
