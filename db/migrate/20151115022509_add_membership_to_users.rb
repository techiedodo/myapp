class AddMembershipToUsers < ActiveRecord::Migration
  def change
    add_column :users, :membership, :integer, default: 0
  end
end
