class AddDataToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :last_name, :string
    add_column :users, :gender, :string
    add_column :users, :description, :string
  end
end
