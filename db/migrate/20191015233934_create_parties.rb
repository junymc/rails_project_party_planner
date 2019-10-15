class CreateParties < ActiveRecord::Migration[6.0]
  def change
    create_table :parties do |t|
      t.string :name
      t.string :description
      t.string :location
      t.datetime :date_time
      t.string :dress_code
      t.integer :host_id

      t.timestamps
    end
  end
end
