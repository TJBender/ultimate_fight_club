class FightClass < ActiveRecord::Base
    belongs_to :instructor
    has_many :student_classes
    has_many :students, through: :student_classes

end