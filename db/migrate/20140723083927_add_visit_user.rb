class AddVisitUser < ActiveRecord::Migration
  def change
  	add_column :visits, :from_date, :timestamp
  	add_column :visits, :to_date, :timestamp
  	add_column :visits, :user_name, :string
  end
end
