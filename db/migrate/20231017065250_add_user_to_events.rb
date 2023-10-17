class AddUserToEvents < ActiveRecord::Migration[7.1]
  def change
    add_reference :events, :user
  end
end
