
#students
Student.create(name: "Ben", age: 12, rank: "Green Belt")
Student.create(name: "Janet", age: 10, rank: "Red Belt")
Student.create(name: "Dominique", age: 10, rank: "Orange Belt")
Student.create(name: "Lily", age: 14, rank: "Camo Belt")
Student.create(name: "Billy", age: 9, rank: "Blue Belt")

#instructors
Instructor.create(name: "c00L 1", rank: "1st Deg. BB")
Instructor.create(name: "MEAN SENSEI", rank: "1st Deg. BB")
Instructor.create(name: "Master Revolution Damnation", rank: "9th Deg. BB")
Instructor.create(name: "Dream Killer", rank: "3rd Deg. BB")
Instructor.create(name: "Bob", rank: "4th Deg. BB")

#fight classes (takes in instructor id to view the instructor for a class)
FightClass.create(type_of_fight: "Krav Maga", instructor_id: 1, start_time: Time.parse("4:00 PM"), end_time: Time.parse("4:45 PM"))
FightClass.create(type_of_fight: "Food Fight", instructor_id: 2, start_time: Time.parse("5:00 PM"), end_time: Time.parse("5:45 PM"))
FightClass.create(type_of_fight: "Fight to the Death", instructor_id: 3, start_time: Time.parse("6:00 PM"), end_time: Time.parse("6:45 PM"))
FightClass.create(type_of_fight: "Pillow Fight", instructor_id: 1, start_time: Time.parse("7:00 PM"), end_time: Time.parse("7:45 PM"))
FightClass.create(type_of_fight: "Kungfu", instructor_id: 4, start_time: Time.parse("8:00 PM"), end_time: Time.parse("8:45 PM"))
FightClass.create(type_of_fight: "Dance Fighting", instructor_id: 4, start_time: Time.parse("9:00 PM"), end_time: Time.parse("9:45 PM"))
#student classes (takes in student id to view all the students in a class)
StudentClass.create(student_id: 1, fight_class_id: 1)
StudentClass.create(student_id: 2, fight_class_id: 2)
StudentClass.create(student_id: 1, fight_class_id: 3)
StudentClass.create(student_id: 3, fight_class_id: 3)
StudentClass.create(student_id: 4, fight_class_id: 5)
StudentClass.create(student_id: 2, fight_class_id: 4)