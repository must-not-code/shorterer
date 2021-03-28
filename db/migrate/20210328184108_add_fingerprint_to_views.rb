class AddFingerprintToViews < ActiveRecord::Migration[6.0]
  def change
    add_column :views, :fingerprint, :string
  end
end
