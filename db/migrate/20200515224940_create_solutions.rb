class CreateSolutions < ActiveRecord::Migration[6.0]
  def change
    create_table :solutions do |t|
      t.string :title
      t.text :guide
      t.integer :user_id
    end
  end
end
