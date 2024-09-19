require_relative 'student'

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
  puts "Student added successfully!"
end

