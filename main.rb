require_relative 'student'
require_relative 'course'
require_relative 'school_personnel'
require_relative 'course_subject'
require_relative 'student_subject'
require_relative 'subject'
require_relative 'teacher'
require_relative 'helpers'
include Helper

def add_student
  puts "COURSES:"
  Course.all.each { |course| course.display }

  id = Student.all.size + 1

  puts "Enter name:"
  name = gets.chomp

  puts "Enter birth date:"
  birth_date = gets.chomp

  puts "Enter email:"
  email = gets.chomp

  puts "Enter phone number:"
  phone_number = gets.chomp

  puts "Enter course id:"
  course_id = gets.to_i

  Helper.clear_console

  student = Student.new
  student.id = id
  student.name = name
  student.birth_date = birth_date
  student.email = email
  student.phone_number = phone_number
  student.course_id = course_id

  if student
    student.save
    add_student_subject(course_id, student.id)
    student.display
    puts "Student added successfully!\n"
    StudentSubject.all.each { |student_subject| student_subject.display }
  end
end

def add_student_subject(course_id, student_id)
  subjects = Course.find(course_id).subjects
  subjects.each { |subject| StudentSubject.new(student_id, subject.id).save }
end

def delete_student
  puts "Enter student id:"
  id = gets.to_i
  Helper.clear_console

  student = Student.find(id)
  if student
    student.destroy
    puts "Student destroyed successfully!\n"
  end
end

def show_students
  puts "(1) Display list of students\n(2) Display specific student\n"
  option = gets.to_i

  case option
  when 1
    puts "Enter number of record(s) to display:"
    query = gets.to_i

    Student.first(query)
  when 2
    puts "Enter student id to display:"
    student_id = gets.to_i

    student = Student.find(student_id)

    unless student.subjects
      puts "No subjects for this student"
      return
    end

    student.display
    puts "Subjects:"
    student.subjects.each { |subject| subject.display }
  end
end

def update_student
  puts "Enter id:"
  id = gets.to_i
  Helper.clear_console

  student = Student.find(id)

  if student
    puts "Enter name:"
    name = gets.chomp

    puts "Enter birth date:"
    birth_date = gets.chomp

    puts "Enter email:"
    email = gets.chomp

    puts "Enter phone number:"
    phone_number = gets.chomp

    student.name = name
    student.birth_date = birth_date
    student.email = email
    student.phone_number = phone_number
    student.display
    puts "#{student} updated successfully!\n"
  end
end

def add_course
  id = Course.all.size + 1

  puts "Enter name:"
  name = gets.chomp
  Helper.clear_console

  course = Course.new(id, name)

  if course
    course.save
    course.display
    puts "Course added successfully!\n"
  end
end

def update_course
  puts "Enter id:"
  id = gets.to_i
  Helper.clear_console

  course = Course.find(id)

  if course
    puts "Enter name:"
    name = gets.chomp

    course.name = name
    course.display
    puts "#{course} updated successfully!\n"
  end
end

def delete_course
  puts "Enter course id:"
  id = gets.to_i
  Helper.clear_console

  course = Course.find(id)

  if course
    course.destroy
    puts "Course destroyed successfully!\n"
  end
end

def show_courses
  puts "(1) Display list of courses\n(2) Display specific course\n"
  option = gets.to_i

  case option
  when 1
    puts "Enter number of record(s) to display:"
    query = gets.to_i

    Course.first(query)
  when 2
    puts "Enter course id to display:"
    course_id = gets.to_i

    course = Course.find(course_id)
    course.display

    while true
      puts "(1) Add subject to course\n(2) Remove subject from course\n(3) Show all students\n(4) Show all subjects \n(5) Back"
      option = gets.chomp

      case option.to_i
      when 1
        add_subjects(course_id)
      when 2
        remove_subjects(course_id)
      when 3
        show_course_students(course)
      when 4
        show_course_subjects(course)
      when 5
        break
      end
    end
  end

end

def add_subjects(course_id)
  Subject.first(nil)

  puts "Enter subject id to add to course:"
  subject_id = gets.to_i

  if CourseSubject.find_by_subject(subject_id)
    puts "Subject already exists in this course\n"
    return
  end

  id = CourseSubject.all.size + 1

  course_subject = CourseSubject.new(id, course_id, subject_id)
  if course_subject
    course_subject.save
    puts "Subject successfully added to course!\n"
  end

  CourseSubject.all.each { |course_subject| Subject.find(course_subject.subject_id).display }
end

def remove_subjects(course_id)
  CourseSubject.all.each { |course_subject| Subject.find(course_subject.subject_id).display }

  puts "Enter subject id to remove from course:"
  subject_id = gets.to_i

  course_subject = CourseSubject.find_by_subject(subject_id)

  if course_subject
    course_subject.destroy
    puts "Subject successfully removed from course!\n"
  end

  CourseSubject.all.each { |course_subject| Subject.find(course_subject.subject_id).display }
end

def show_course_subjects(course)
  course.subjects.each { |subject| subject.display }
end

def show_course_students(course)
  course.students.each { |student| student.display }
end

def add_subject
  id = Subject.all.size + 1

  puts "Enter name:"
  name = gets.chomp
  Helper.clear_console

  subject = Subject.new(id, name)

  if subject
    subject.save
    subject.display
    puts "Subject added successfully!\n"
  end
end

def update_subject
  puts "Enter id:"
  id = gets.to_i
  Helper.clear_console

  subject = Subject.find(id)

  if subject
    puts "Enter name:"
    name = gets.chomp

    subject.name = name
    subject.display
    puts "#{subject} updated successfully!\n"
  end
end

def delete_subject
  puts "Enter subject id:"
  id = gets.to_i
  Helper.clear_console

  subject = Subject.find(id)
  if subject
    subject.destroy
    puts "Subject destroyed successfully!\n"
  end
end

def show_subjects
  puts "Enter number of record(s) to display:"
  query = gets.to_i

  Subject.first(query)
end

def add_teacher
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

  if teacher
    teacher.save
    teacher.display
    puts "Teacher added successfully!\n"
  end
end

def update_teacher
  puts "Enter id:"
  id = gets.to_i
  Helper.clear_console

  teacher = Teacher.find(id)

  if teacher
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

    teacher.name = name
    teacher.birth_date = birth_date
    teacher.email = email
    teacher.phone_number = phone_number
    teacher.department = department
    teacher.display
    puts "#{teacher} updated successfully!\n"
  end
end

def delete_teacher
  puts "Enter teacher id:"
  id = gets.to_i
  Helper.clear_console

  teacher = Teacher.find(id)
  if teacher
    teacher.destroy
    puts "Teacher destroyed successfully!\n"
  end
end

def show_teachers
  puts "Enter number of record(s) to display:"
  query = gets.to_i

  Teacher.first(query)
end

option = nil
while option != 'exit'
  puts "Choose an option below:\n"
  puts "(1) Student Management\n(2) Course Management\n(3) Subject Management\n(4) Teacher Management\n"
  option = gets.chomp
  Helper.clear_console

  case option.to_i
    # Student Management
  when 1
    until option.to_i == 5
      option = Helper.add_delete_prompt("Student")
      Helper.clear_console

      case option.to_i
        # Add Student
      when 1
        add_student
        # Delete Student
      when 2
        delete_student
      when 3
        show_students
      when 4
        update_student
      end
    end
    # Course Management
  when 2
    until option.to_i == 5
      option = Helper.add_delete_prompt("Course")
      Helper.clear_console

      case option.to_i
        # Add course
      when 1
        add_course
        # Delete Course
      when 2
        delete_course
      when 3
        show_courses
      when 4
        update_course
      end
    end
    # Subject Management
  when 3
    until option.to_i == 5
      option = Helper.add_delete_prompt("Subject")
      Helper.clear_console

      case option.to_i
        # Add Subject
      when 1
        add_subject
        # Delete Subject
      when 2
        delete_subject
        # Show Subject
      when 3
        show_subjects
        # Update Subject
      when 4
        update_subject
      end
    end
    # Teacher Management
  when 4
    until option.to_i == 5
      option = Helper.add_delete_prompt("Teacher")
      Helper.clear_console

      case option.to_i
        # Add Teacher
      when 1
        add_teacher
        # Delete Teacher
      when 2
        delete_teacher
      when 3
        show_teachers
      when 4
        update_teacher
      end
    end
  end

end

puts "Student\n\n"
Student.all.each { |elem| elem.display }
# puts "Course\n\n"
# Course.all.each { |elem| elem.display }
# puts "Subject\n\n"
# Subject.all.each { |elem| elem.display }
puts "Teacher\n\n"
Teacher.all.each { |elem| elem.display }

