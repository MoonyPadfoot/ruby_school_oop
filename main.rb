require_relative 'student'
require_relative 'course'
require_relative 'subject'
require_relative 'teacher'
require_relative 'helpers'
include Helper

option = nil
while option != 'exit'
  puts "Choose an option below:\n"
  puts "(1) Student Management\n(2) Course Management\n(3) Subject Management\n(4) Teacher Management\n"
  option = gets.chomp
  Helper.clear_console

  case option.to_i
    # Student Management
  when 1
    option = Helper.add_delete_prompt("Student")
    Helper.clear_console

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

      Helper.clear_console

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
      Helper.clear_console

      student = Student.find(id)
      puts "Student destroyed successfully!\n" if student.destroy

    end
    # Course Management
  when 2
    option = Helper.add_delete_prompt("Course")
    Helper.clear_console

    case option.to_i
      # Add course
    when 1
      id = Course.all.size + 1

      puts "Enter name:"
      name = gets.chomp
      Helper.clear_console

      course = Course.new(id, name)

      if course.save
        course.display
        puts "Course added successfully!\n"
      end
      # Delete Course
    when 2
      puts "Enter course id:"
      id = gets.to_i
      Helper.clear_console

      course = Course.find(id)
      puts "Course destroyed successfully!\n" if course.destroy

    end
    # Subject Management
  when 3
    option = Helper.add_delete_prompt("Subject")
    Helper.clear_console

    case option.to_i
      # Add Subject
    when 1
      id = Subject.all.size + 1

      puts "Enter name:"
      name = gets.chomp
      Helper.clear_console

      subject = Subject.new(id, name)

      if subject.save
        subject.display
        puts "Subject added successfully!\n"
      end
      # Delete Subject
    when 2
      puts "Enter subject id:"
      id = gets.to_i
      Helper.clear_console

      subject = Subject.find(id)
      puts "Subject destroyed successfully!\n" if subject.destroy
    end
    # Teacher Management
  when 4
    option = Helper.add_delete_prompt("Teacher")
    Helper.clear_console

    case option.to_i
      # Add Teacher
    when 1
      id = Teacher.all.size + 1

      puts "Enter name:"
      name = gets.chomp

      puts "Enter birth date:"
      birth_date = gets.chomp

      puts "Enter email:"
      email = gets.chomp

      puts "Enter phone number:"
      phone_number = gets.chomp

      puts "Enter department:"
      department = gets.chomp

      Helper.clear_console

      teacher = Teacher.new
      teacher.id = id
      teacher.name = name
      teacher.birth_date = birth_date
      teacher.email = email
      teacher.phone_number = phone_number
      teacher.department = department

      if teacher.save
        teacher.display
        puts "Teacher added successfully!\n"
      end
      # Delete Teacher
    when 2
      puts "Enter teacher id:"
      id = gets.to_i
      Helper.clear_console

      teacher = Teacher.find(id)
      puts "Teacher destroyed successfully!\n" if teacher.destroy
    end
  end

end

puts "Student\n\n"
Student.all.each { |elem| elem.display }
puts "Course\n\n"
Course.all.each { |elem| elem.display }
puts "Subject\n\n"
Subject.all.each { |elem| elem.display }
puts "Teacher\n\n"
Teacher.all.each { |elem| elem.display }

