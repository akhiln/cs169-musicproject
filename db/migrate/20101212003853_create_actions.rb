class CreateActions < ActiveRecord::Migration
  def self.up
    create_table :actions do |t|
      t.integer :user_id
      t.string :action
      t.string :obj_type
      t.integer :obj_id

      t.timestamps
    end
  end

  def self.down
    drop_table :actions
  end
end
