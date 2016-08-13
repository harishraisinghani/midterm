class Addprofileid < ActiveRecord::Migration
  def change

    change_table :feedbacks do |t|
      t.integer :profile_id
    end

  end
  
end


