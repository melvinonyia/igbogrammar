class RemoveAndAddToUsers < ActiveRecord::Migration[5.2]
  def up
    add_column(:users, :username, :string, { null: false } )
  end

  def down
    remove_column(:users, :email )
    remove_column(:users, :name )
    remove_column(:users, :activated )
    remove_column(:users, :activation_token )
  end
end
