require_relative 'student'

option = nil
while option != 'exit'
  puts "Choose an option below:\n"
  puts "(1) Add Student\n(2) Delete Student\n"
  option = gets.chomp

  case option.to_i
  when 1
    id = Student.all.size + 1

    puts "Enter name:"
    name = gets.chomp

    puts "Enter birth date:"
    birth_date = gets.chomp

    puts "Enter email:"
    email = gets.chomp

    puts "Enter phone number:"
    phone_number = gets.chomp

    student = Student.new
    student.id = id
    student.name = name
    student.birth_date = birth_date
    student.email = email
    student.phone_number = phone_number

    puts "Student added successfully!\n" if student.save

  when 2
    puts "Enter student id:"
    id = gets.to_i

    student = Student.find(id)
    puts "Student destroyed successfully!\n" if student.destroy

  end
end

