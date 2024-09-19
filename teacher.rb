class Teacher
  attr_accessor :id, :name, :birth_date, :email, :phone_number, :department

  def initialize(id = nil, name = nil, birth_date = nil, email = nil, phone_number = nil, department = nil)
    @id = id
    @name = name
    @birth_date = birth_date
    @email = email
    @phone_number = phone_number
    @department = department
  end

  @@record = []

  def save
    @@record.prepend(self)
  end

  def destroy
    @@record.delete(self)
  end

  def display
    puts "ID: #{@id}"
    puts "Name: #{@name}"
    puts "Birth date: #{@birth_date}"
    puts "Email: #{@email}"
    puts "Phone number: #{@phone_number}"
    puts "Department: #{@department}"
    puts "===============\n"
  end

  def self.all
    @@record
  end

  def self.find(id)
    @@record.find { |teacher| teacher.id == id }
  end

  def self.find_by_email(email)
    @@record.find { |teacher| teacher.email = email }
  end
end