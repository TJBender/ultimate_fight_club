class CreateFightClasses < ActiveRecord::Migration[5.2]
  def change
    create_table :fight_classes do |f|
      f.string :type_of_fight
      f.integer :instructor_id
      f.datetime :start_time
      f.datetime :end_time
    end
  end
end
