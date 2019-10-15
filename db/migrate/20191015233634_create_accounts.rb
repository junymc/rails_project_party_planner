class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :email
      t.string :password_digest
      t.references :accountable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
