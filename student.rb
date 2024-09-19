class Student
  attr_accessor :id, :name, :birth_date, :email, :phone_number

  def initialize(id = nil, name = nil, birth_date = nil, email = nil, phone_number = nil)
    @id = id
    @name = name
    @birth_date = birth_date
    @email = email
    @phone_number = phone_number
  end

  @@record = [Student.new(1, 'test', '1997', 'test@mail.com', '631234113')]

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
    puts "===============\n"
  end

  def self.all
    @@record
  end

  def self.find(id)
    @@record.find { |student| student.id == id }
  end

  def self.find_by_email(email)
    @@record.find { |student| student.email = email }
  end
end