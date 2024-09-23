require_relative 'school_personnel'
class Student < SchoolPersonnel
  attr_accessor :course_id

  def initialize(id = nil, name = nil, birth_date = nil, email = nil, phone_number = nil, deleted_at = nil)
    super
    @course_id = course_id
  end

  @@record = [
    Student.new(1, 's1', '1992', 's1@m.co', '43819219'),
    Student.new(2, 's2', '1992', 's1@m.co', '43819219'),
    Student.new(3, 's3', '1992', 's1@m.co', '43819219'),
  ]

  def save
    @@record.prepend(self)
  end

  def destroy
    student = @@record.find { |student| student == self }
    student.deleted_at = Time.now if student
  end

  def display
    super
    Course.find(@course_id).display
    puts "===============\n"
  end

  def subjects
    return nil unless @course_id
    Course.find(@course_id).subjects
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