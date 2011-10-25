class AssociateJobUser < ActiveRecord::Migration
  def change
    add_column :jobs, :user_id, :integer
  end
end
