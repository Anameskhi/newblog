class AddStatusToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :status, :string
    #add_reference :articles, :users, index: true, foreign_key: true
  end
end
