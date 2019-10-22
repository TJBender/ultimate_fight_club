class Instructor < ActiveRecord::Base
    has_many :fight_classes
    has_many :student_classes, through: :fight_classes
    has_many :students, through: :student_classes

def find_instructor
    find_user = PROMPT.ask('What is your name?')
    @instructor = Instructor.find_by(name: find_user)
    puts "Ahhh.. Welcome, #{@instructor.name}."
end

def instructor_options
  puts "\n"
  choice = PROMPT.select("What great deed shall we accomplish today?", [
    "View My Classes",
    "Make New Class",
    "Exit"
  ])
  if choice == "View My Classes"
    @instructor.fight_classes.each do |fight|
      puts "Class Type: " + fight.type_of_fight
      puts "Start Time: " + fight.start_time.strftime("%I:%M %p")
      puts "End Time: " + fight.end_time.strftime("%I:%M %p")
    end
  elsif choice == "Exit"
    puts "Wax on... Wax OFF!"
  elsif choice == "Make New Class"
    fight_type = PROMPT.ask("What kind of class?")
    s_time = PROMPT.ask("What time does it start?")
    e_time = PROMPT.ask("What time does it end")
      FightClass.create(
        type_of_fight: fight_type,
        instructor_id: @instructor.id,
        start_time: Time.parse(s_time),
        end_time: Time.parse(e_time)
      )
  end
end

end