class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|

      t.timestamps null: false
    end
  end
end
