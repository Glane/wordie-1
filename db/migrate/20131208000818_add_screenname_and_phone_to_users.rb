class AddScreennameAndPhoneToUsers < ActiveRecord::Migration
  def change
    add_column :users, :twitter_screenname, :string
    add_column :users, :phone, :integer
  end
end
