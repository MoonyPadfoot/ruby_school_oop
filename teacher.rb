require_relative 'school_personnel'
class Teacher < SchoolPersonnel
  attr_accessor :department

  def initialize(id = nil, name = nil, birth_date = nil, email = nil, phone_number = nil, department = nil, deleted_at = nil)
    super(id, name, birth_date, email, phone_number, deleted_at)
    @department = department
  end

  @@record = [
    Teacher.new(1, 't1', '1992', 's1@m.co', '43819219', 'eng'),
    Teacher.new(2, 't2', '1992', 's1@m.co', '43819219', 'fil'),
    Teacher.new(3, 't3', '1992', 's1@m.co', '43819219', 'math'),
  ]

  def save
    @@record.prepend(self)
  end

  def destroy
    teacher = @@record.find { |teacher| teacher == self }
    teacher.deleted_at = Time.now if teacher
  end

  def display
    super
    puts "Department: #{@department}"
    puts "===============\n"
  end

  def self.all
    @@record.select { |teacher| !teacher.deleted_at }
  end

  def self.first(query)
    query ? @@record[0..query - 1].each { |teacher| teacher.display unless teacher.deleted_at }
      : self.all.each { |teacher| teacher.display unless teacher.deleted_at }
  end

  def self.find(id)
    @@record.find { |teacher| teacher.id == id && !teacher.deleted_at }
  end

  def self.find_by_email(email)
    @@record.find { |teacher| teacher.email = email && !teacher.deleted_at }
  end
end