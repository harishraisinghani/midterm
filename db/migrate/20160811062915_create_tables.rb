class CreateTables < ActiveRecord::Migration
 
  def change

    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.timestamps
    end

    create_table :favourites do |t|
      t.integer :user_id
      t.integer :favourite_user_id
      t.timestamps
    end

    create_table :userskills do |t|
      t.integer :skill_id
      t.integer :user_id
      t.integer :years_experience
      t.timestamps
    end

    create_table :skills do |t|
      t.string :name
      t.timestamps
    end

    create_table :feedbacks do |t|
      t.integer :user_id
      t.integer :rating
      t.integer :user_type
      t.text    :content
      t.timestamps
    end

  end

end
