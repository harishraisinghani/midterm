class ModifyUserskills < ActiveRecord::Migration
  def change
    rename_table :userskills, :user_skills
  end
end
