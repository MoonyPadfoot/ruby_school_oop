require_relative 'student'
require_relative 'course'
require_relative 'subject'

option = nil
while option != 'exit'
  puts "Choose an option below:\n"
  puts "(1) Student Management\n(2) Course Management\n(3) Subject Management\n"
  option = gets.chomp

  case option.to_i
    # Student Management
  when 1
    puts "Choose an option below:\n"
    puts "(1) Add Student\n(2) Delete Student\n"
    option = gets.chomp

    case option.to_i
      # Add Student
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
      # Delete Student
    when 2
      puts "Enter student id:"
      id = gets.to_i

      student = Student.find(id)
      puts "Student destroyed successfully!\n" if student.destroy

    end
    # Course Management
  when 2
    puts "Choose an option below:\n"
    puts "(1) Add Course\n(2) Delete Course\n"
    option = gets.chomp

    case option.to_i
      # Add course
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
      # Delete Course
    when 2
      puts "Enter course id:"
      id = gets.to_i

      course = Course.find(id)
      puts "Course destroyed successfully!\n" if course.destroy

    end
    # Subject Management
  when 3
    puts "Choose an option below:\n"
    puts "(1) Add Subject\n(2) Delete Subject\n"
    option = gets.chomp

    case option.to_i
      # Add Subject
    when 1
      id = Subject.all.size + 1

      puts "Enter name:"
      name = gets.chomp

      subject = Subject.new
      subject.id = id
      subject.name = name

      if subject.save
        subject.display
        puts "Subject added successfully!\n"
      end
      # Delete subject
    when 2
      puts "Enter subject id:"
      id = gets.to_i

      subject = Subject.find(id)
      puts "Subject destroyed successfully!\n" if subject.destroy
    end
  end

end

puts "Student\n\n"
puts Student.all.each { |elem| elem.display }
puts "Course\n\n"
puts Course.all.display { |elem| elem.display }
puts "Subject\n\n"
puts Subject.all.display { |elem| elem.display }
puts "Teacher\n\n"
puts Teacher.all.display { |elem| elem.display }

