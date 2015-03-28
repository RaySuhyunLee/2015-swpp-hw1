class CreateUserAccounts < ActiveRecord::Migration
  def change
    create_table :user_accounts do |t|
      t.string :username
      t.string :pass
			t.integer :count

      t.timestamps null: false
    end
  end
end
