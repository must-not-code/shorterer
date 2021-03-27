class CreateViews < ActiveRecord::Migration[6.0]
  def change
    create_table :views do |t|
      t.integer :short_url_id
      t.string :platform
      t.string :device
      t.string :country
      t.datetime :created_at
    end
  end
end
