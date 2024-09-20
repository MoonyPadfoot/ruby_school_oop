class CourseSubject
  attr_accessor :id, :course_id, :subject_id

  def initialize(id = nil, course_id = nil, subject_id = nil)
    @id = id
    @course_id = course_id
    @subject_id = subject_id
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
    puts "Course ID: #{@course_id}"
    puts "Subject ID: #{@subject_id}"
    puts "===============\n"
  end

  def self.all
    @@record
  end

  def self.find(id)
    @@record.find { |course_subject| course_subject.id == id }
  end

end