class CreateInvites < ActiveRecord::Migration[6.0]
  def change
    create_table :invites do |t|
      t.integer :guest_id
      t.integer :party_id
      t.integer :add_on
      t.boolean :rsvp, default: true

      t.timestamps
    end
  end
end
