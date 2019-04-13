class AmendUsersIndex < ActiveRecord::Migration[5.2]
  def change
    remove_index :users, column: :email
    add_index :users, [:email, :role], unique: true
  end
end
