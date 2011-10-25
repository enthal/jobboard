class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :user
      t.references :job
      t.text :body

      t.timestamps
    end
    add_index :messages, :user_id
    add_index :messages, :job_id
  end
end
