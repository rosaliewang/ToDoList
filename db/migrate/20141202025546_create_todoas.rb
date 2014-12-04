class CreateTodoas < ActiveRecord::Migration
  def change
    create_table :todoas do |t|
      t.string :content
      t.date :due
      t.boolean :done
      t.integer :user_id
      t.timestamps
    end
  end
end
