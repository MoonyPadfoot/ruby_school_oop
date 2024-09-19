class Student
  attr_accessor :id, :name, :birth_date, :email, :phone_number

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
    puts "==============="
  end

  def self.all
    @@record
  end

  def self.find(id)
    @@record.find { |person| person.id == id }
  end

  def self.find_by_email(email)
    @@record.find { |person| person.email = email }
  end
end