class CreateInstructors < ActiveRecord::Migration[5.2]
  def change
    create_table :instructors do |i|
      i.string :name
      i.string :rank 
    end
  end
end
