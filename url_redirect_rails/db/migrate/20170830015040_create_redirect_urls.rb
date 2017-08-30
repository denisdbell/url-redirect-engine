class CreateRedirectUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :redirect_urls do |t|
      t.string :old_url
      t.string :new_url

      t.timestamps
    end
  end
end
