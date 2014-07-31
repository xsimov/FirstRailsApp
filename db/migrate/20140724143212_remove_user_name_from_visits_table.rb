class RemoveUserNameFromVisitsTable < ActiveRecord::Migration
  def change
  	remove_column :visits, :user_name
  end
end
