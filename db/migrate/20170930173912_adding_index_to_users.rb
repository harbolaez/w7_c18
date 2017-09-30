class AddingIndexToUsers < ActiveRecord::Migration[5.1]
  def change
    add_index(:users, :first_name)
    add_index(:users, :last_name)
    add_index(:users, :email, unique: true)
  end
end
