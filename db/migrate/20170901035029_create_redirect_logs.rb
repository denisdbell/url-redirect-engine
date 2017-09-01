class CreateRedirectLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :redirect_logs do |t|
      t.string :old_url
      t.string :new_url
      t.string :rule
      t.string :status

      t.timestamps
    end
  end
end
