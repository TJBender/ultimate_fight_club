class Student < ActiveRecord::Base
    has_many :student_classes
    has_many :fight_classes, through: :student_classes
    has_many :instructors, through: :fight_classes
end