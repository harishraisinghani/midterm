class Addpicture < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :picture
    end

  end

end
