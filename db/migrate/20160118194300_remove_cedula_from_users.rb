class RemoveCedulaFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :cedula, :string
  end
end
