PROMPT = TTY::Prompt.new
def find_instructor
  find_user = PROMPT.ask('Welcome Sensei, what is your name?')
  instructor = Instructor.find_or_create_by(name: find_user)
    puts "Ahhh.. Welcome, #{instructor.name}."
    return instructor
end

def instructor_options(on_instructor)
  instructor = Instructor.find(on_instructor.id)
  while true do
  puts "\n"
  choice = PROMPT.select("What great deed shall we accomplish today?", [
    "View My Classes",
    "Make New Class",
    "Update A Class",
    "Cancel A Class",
    "Main Menu"
  ])
  if choice == "View My Classes"
    instructor_view_classes(instructor)
  elsif choice == "Main Menu"
    return
  elsif choice == "Make New Class"
  instructor_make_new_fight(instructor)
  elsif choice == "Update A Class"
    instructor_update_fight(instructor)
  elsif choice == "Cancel A Class"
    instructor_cancel_class(instructor)
  end
end

end