require_relative "../config/environment"
require "tty-prompt"


class CommandLineInterface
PROMPT = TTY::Prompt.new
attr_accessor :instructor

def run
  greet
  instructor_or_student
  # instructor_or_student
  # find_instructor
  # instructor_options
end

def greet 
    puts '=' * 50
    puts '    Welcome to the ULTIMATE FIGHT CLUB APP!!!'
    puts '=' * 50
end



# 1 see if they are an instructor or student
def instructor_or_student
  user_type = PROMPT.select("Are you a Student or Instructor?", 
    ["Student","Instructor"])

  case user_type
  when "Instructor"
    Instructor.
  end

end

#2 get instructor name
# def find_instructor
#   find_user = PROMPT.ask('What is your name?')
#   @instructor = Instructor.find_by(name: find_user)
#     puts "Ahhh.. Welcome, #{@instructor.name}."
# end

# def instructor_options
#   puts "\n"
#   choice = PROMPT.select("What great deed shall we accomplish today?", [
#     "View My Classes",
#     "Make New Class",
#     "Exit"
#   ])
#   if choice == "View My Classes"
#     @instructor.fight_classes.each do |fight|
#       puts "Class Type: " + fight.type_of_fight
#       puts "Start Time: " + fight.start_time.strftime("%I:%M %p")
#       puts "End Time: " + fight.end_time.strftime("%I:%M %p")
#     end
#   elsif choice == "Exit"
#     puts "Wax on... Wax OFF!"
#   elsif choice == "Make New Class"
#     fight_type = PROMPT.ask("What kind of class?")
#     s_time = PROMPT.ask("What time does it start?")
#     e_time = PROMPT.ask("What time does it end")
#       FightClass.create(
#         type_of_fight: fight_type,
#         instructor_id: @instructor.id,
#         start_time: Time.parse(s_time),
#         end_time: Time.parse(e_time)
#       )
#   end
# end



end

