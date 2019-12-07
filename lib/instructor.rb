class Instructor < ActiveRecord::Base
    has_many :fight_classes
    has_many :student_classes, through: :fight_classes
    has_many :students, through: :student_classes
end