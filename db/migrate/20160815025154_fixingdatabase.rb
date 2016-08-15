class Fixingdatabase < ActiveRecord::Migration
 
  def change
    change_table :feedbacks do |t|
      t.remove :rating, :integer
      t.float :rating
    end
  end

end
