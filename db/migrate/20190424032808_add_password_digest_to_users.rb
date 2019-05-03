class AddPasswordDigestToUsers < ActiveRecord::Migration[5.1]
  def change
   add_column :users, :password_digest, :string
   add_column, table name, column name, type of data in column
  end
end