class Student
  attr_accessor :id, :name, :birth_date, :email, :phone_number, :course_id, :deleted_at

  def initialize(id = nil, name = nil, birth_date = nil, email = nil, phone_number = nil, course_id = nil, deleted_at = nil)
    @id = id
    @name = name
    @birth_date = birth_date
    @email = email
    @phone_number = phone_number
    @course_id = course_id
    @deleted_at = deleted_at
  end

  @@record = [
    Student.new(1, 's1', '1992', 's1@m.co', '43819219'),
    Student.new(2, 's1', '1992', 's1@m.co', '43819219'),
    Student.new(3, 's1', '1992', 's1@m.co', '43819219'),
  ]

  def save
    @@record.prepend(self)
  end

  def destroy
    student = @@record.find { |student| student == self }
    student.deleted_at = Time.now if student
  end

  def display
    puts "ID: #{@id}"
    puts "Name: #{@name}"
    puts "Birth date: #{@birth_date}"
    puts "Email: #{@email}"
    puts "Phone number: #{@phone_number}"
    Course.find(@course_id).display
  end

  def self.all
    @@record.select { |student| !student.deleted_at }
  end

  def self.first(query)
    query ? @@record[0..query - 1].each { |student| student.display unless student.deleted_at }
      : self.all.each { |student| student.display unless student.deleted_at }
  end

  def self.find(id)
    @@record.find { |student| student.id == id && !student.deleted_at }
  end

  def self.find_by_email(email)
    @@record.find { |student| student.email = email && !student.deleted_at }
  end
end