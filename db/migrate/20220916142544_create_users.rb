class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.column :first_name, :string, :null => false
      t.column :last_name, :string, :null => false
      t.column :email, :string,:null => false
      t.column :phone_number, :string, :limit => 10 ,:null => false
      t.column :password, :string, :null => false
      t.column :profile_picture, :string
      t.timestamps
    end
  end
end
