class CreateRedirects < ActiveRecord::Migration[5.1]
  def change
    create_table :redirects do |t|
      t.string :rule
      t.string :new_url

      t.timestamps
    end
  end
end
