# created with rails g migration add_user_id_to_pins user_id:integer:index
class AddUserIdToPins < ActiveRecord::Migration[5.0]
  def change
    add_column :pins, :user_id, :integer
    add_index :pins, :user_id
  end
end
