class CreateShortUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :short_urls do |t|
      t.string :url
      t.string :slug, index: { unique: true }
      t.integer :views_count, default: 0
      t.datetime :created_at
    end
  end
end
