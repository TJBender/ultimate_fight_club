def find_student
  find_user = PROMPT.ask('What is your name?')
  student = Student.find_or_create_by(name: find_user)
    puts "Ahhh.. Welcome, #{student.name}."
    return student
end



def student_options(on_student)
    student = Student.find(on_student.id)
  while true do
    puts "\n"
  choice = PROMPT.select("What great deed shall we accomplish today?", [
    "View My Classes",
    "Join A Class",
    "View My Instructors",
    "Cancel A Class",
    "Main Menu"
  ])
  if choice == "View My Classes"
    student_view_classes(student)
  elsif choice == "Main Menu"
    return
  elsif choice == "Join A Class"
    student_join_a_class(student)
  elsif choice == "Cancel A Class"
    student_cancel_class(student)
  end

    end

end