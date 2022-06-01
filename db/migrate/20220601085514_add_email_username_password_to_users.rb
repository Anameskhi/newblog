class AddEmailUsernamePasswordToUsers < ActiveRecord::Migration[7.0]
  def change
      add_column :users, :username, :varchar
      add_column :users, :email, :varchar
      add_column :users, :password, :varchar
  end
end
