require_relative "../config/environment"
require "tty-prompt"



class 
  CommandLineInterface
PROMPT = TTY::Prompt.new
attr_accessor :instructor

def run
  while true do
    
  greet
  `say "Welcome, please don't kill anyone"`
  found_user = instructor_or_student  
  if found_user == "Instructor"
    `say "You will never be Bruce Lee"`
    @current_instructor = find_instructor
    instructor_options(@current_instructor)
  else 
    `say "You'll regret this. for sure"`
    @current_student = find_student
    student_options(@current_student)
  end
end
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
end

def student_view_classes(a_student)
    student = Student.find(a_student.id)
    # binding.pry
     if student.fight_classes.reload.length == 0
        puts "=" * 50
        puts "You have no classes"
        puts "=" * 50
        `say "join a class you loser"`
     else
    student.fight_classes.each do |fight|
      puts "=" * 50
      puts "Class Type: " + fight.type_of_fight
      puts "Start Time: " + fight.start_time.getlocal.strftime("%I:%M %p")
      puts "End Time: " + fight.end_time.getlocal.strftime("%I:%M %p")
      puts "=" * 50
    end
  end
      response = PROMPT.select("", ["Main Menu"])
      return nil if response == "Main Menu" 
end

def student_join_a_class(one_student)
  `say "Make the right choice or else i will kill you."`
  fight_class_names = FightClass.all.map{|fg| "#{fg.type_of_fight} - #{fg.start_time.getlocal.strftime("%I:%M %p")}"}
    fight_selection = PROMPT.select("What class do you want to join?", fight_class_names)
        fight_array = fight_selection.split(" - ")
        fight_class_inst = FightClass.find_by(type_of_fight: fight_array[0])
        StudentClass.create(student_id: one_student.id, fight_class_id: fight_class_inst.id)
            puts "\n"
            puts "Wax ON! Good choice. You've been added to the class."
            puts "\n"
            `say "you probably won't make it out alive"`
   response = PROMPT.select("Chuck Noris told me to...", ["Main Menu", "Exit"])
    return nil if response == "Main Menu"
    abort("Bruce Lee says to do your pushups..." ) if  response == "Exit"
end

def student_cancel_class(student)
  fight_class_names = StudentClass.where(student_id: student.id).map{|fg| 
  "#{FightClass.find(fg.fight_class_id).type_of_fight} - #{FightClass.find(fg.fight_class_id).start_time.getlocal.strftime("%I:%M %p")}"}

#=============V
  arr = StudentClass.where(student_id: student.id)
  hash = {}

  i = 0
  while i < arr.size do

    hash[fight_class_names[i]] = arr[i]
    i+=1
  end

#==============^
  fight_selection = PROMPT.select("What class do you want to cancel?", fight_class_names)
        fight_array = fight_selection.split(" - ")
        #==========V
        student_class_inst = hash[fight_selection]
        # binding.pry
        #========== ^
        #fight_class_inst = FightClass.find_by(type_of_fight: fight_array[0], start_time: fight_array[1])
        
        #found_student_class = StudentClass.find_by(student_id: student.id, fight_class_id: fight_class_inst.id)
        
        StudentClass.destroy(student_class_inst.id)
        `say "I am not mad. I am just dissapointed."`
        puts "=" * 50
        puts "You've cancled this class... you're a quitter..."
        puts "=" * 50
  
    response = PROMPT.select("Chuck Noris told me to go to the...", ["Main Menu", "Exit"])
    return nil if response == "Main Menu"
    abort("Bruce Lee says to do your pushups...") if  response == "Exit"
end

def instructor_view_classes(instructor)
  if instructor.fight_classes.reload.length == 0
        puts "=" * 50
        puts "You have no classes"
        puts "=" * 50
    `say "You should have been a Lawyer instead"`
     else
instructor.fight_classes.reload.each do |fight|
      puts "=" * 50
      puts "Class Type: " + fight.type_of_fight
      puts "Start Time: " + fight.start_time.getlocal.strftime("%I:%M %p")
      puts "End Time: " + fight.end_time.getlocal.strftime("%I:%M %p")
      puts "=" * 50
    end
  end
   response = PROMPT.select("", ["Main Menu"])
  return nil if response == "Main Menu" 
end

def instructor_make_new_fight(instructor)
  `say "I wish I was at home writing tweets about coffee."`
  fight_type = PROMPT.ask("What kind of class?")
    s_time = PROMPT.ask("What time does it start?")
    e_time = PROMPT.ask("What time does it end")
      fight = FightClass.create(
        type_of_fight: fight_type,
        instructor_id: instructor.id,
        start_time: Time.parse(s_time),
        end_time: Time.parse(e_time)
      )
      `say "It's going to be a bloodbath"`
end


def instructor_update_fight(instructor)
  `say "If only you hadn't been an art major."`
    if instructor.fight_classes.length == 0
        puts "=" * 50
        puts "You have no classes to update"
        puts "=" * 50
      response
     else
 
  fight_type = PROMPT.select("Which one do you want to update?", FightClass.where(instructor_id: instructor.id).map{|f| "#{f.type_of_fight} - #{f.id}" })
    array_temp = fight_type.split(" - ")
  s_time = PROMPT.ask("What's the new start time?")
    e_time = PROMPT.ask("What the new end time?")
    fight_class = FightClass.find(array_temp[1])
    fight_class.start_time = Time.parse(s_time)
    fight_class.end_time = Time.parse(e_time)
    fight_class.save
      puts "=" * 60
      puts "You've updated this class and pissed off a lot of parents"
      puts "=" * 60
      `say "It is so confusing when you mess with my emotion like that"`
    response
     end
end

def instructor_cancel_class(instructor)
  fight_selection = PROMPT.select("Which one do you want to cancel?", FightClass.all.reload.map {|f| f.type_of_fight })
  # fight_class_names = StudentClass.where(student_id: student.id).map{|fg| 
  # "#{FightClass.find(fg.fight_class_id).type_of_fight} - #{FightClass.find(fg.fight_class_id).start_time}"}
#=============V
  arr = FightClass.where(instructor_id: instructor.id)
  hash = {}
  i = 0
  while i < arr.size do
    hash[fight_selection[i]] = arr[i]
    i+=1
  end
  selected_class_inst = hash[fight_selection]
        
  FightClass.destroy(selected_class_inst.id)

    puts "Think of all the students you just dissapointed..."
    puts "=" * 50
    response = PROMPT.select("Chuck Noris told me to...", ["Main Menu", "Exit"])
    return nil if response == "Main Menu"
    abort("Bruce Lee says to do your pushups...") if  response == "Exit"
end

def response
  response = PROMPT.select("", ["Main Menu"])
  return nil if response == "Main Menu"
end



end

