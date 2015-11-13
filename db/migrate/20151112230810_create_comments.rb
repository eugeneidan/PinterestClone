class CreateComments < ActiveRecord::Migration

  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :pin_id
      t.text :body

      t.timestamps null: false
    end
    add_index :comments, :pin_id
  end

end
