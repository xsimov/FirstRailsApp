class AddACity < ActiveRecord::Migration
  def change
  	add_column :locations, :city, :string
  end
end
