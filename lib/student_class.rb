class StudentClass < ActiveRecord::Base
    belongs_to :student 
    belongs_to :fight_class
end