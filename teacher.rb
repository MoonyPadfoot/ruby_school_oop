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
    super(@@record)
    # teacher = @@record.find { |teacher| teacher == self }
    # teacher.deleted_at = Time.now if teacher
  end

  def display
    super
    puts "Department: #{@department}"
    puts "===============\n"
  end

  def self.all
    super(@@record)
  end

  def self.first(query)
    super(query, @@record)
  end

  def self.find(id)
    super(id, @@record)
  end

  def self.find_by_email(email)
    super(email, @@record)
  end
end