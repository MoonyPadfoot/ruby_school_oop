require_relative 'student'
require_relative 'course'

option = nil
while option != 'exit'
  puts "Choose an option below:\n"
  puts "(1) Student Management\n(2) Course Management\n"
  option = gets.chomp

  case option.to_i
  when 1
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

      if student.save
        student.display
        puts "Student added successfully!\n"
      end

    when 2
      puts "Enter student id:"
      id = gets.to_i

      student = Student.find(id)
      puts "Student destroyed successfully!\n" if student.destroy

    end
  when 2
    puts "Choose an option below:\n"
    puts "(1) Add Course\n(2) Delete Course\n"
    option = gets.chomp

    case option.to_i
    when 1
      id = Course.all.size + 1

      puts "Enter name:"
      name = gets.chomp

      course = Course.new
      course.id = id
      course.name = name

      if course.save
        course.display
        puts "Course added successfully!\n"
      end

    when 2

    end
  end

end

