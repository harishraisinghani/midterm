class Addlearnteach < ActiveRecord::Migration
   def change
    change_table :user_skills do |t|
      t.integer :learn_teach
    end

  end
end
