class CreateForums < ActiveRecord::Migration[6.0]
  def change
    create_table :forums do |t|
      t.string :title
      t.text :comment
      t.integer :user_id
    end
  end
end
