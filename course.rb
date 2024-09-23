class Course
  attr_accessor :id, :name, :deleted_at

  def initialize(id = nil, name = nil, deleted_at = nil)
    @id = id
    @name = name
    @deleted_at = deleted_at
  end

  @@record = [
    Course.new(1, 'c1'),
    Course.new(2, 'c2'),
  ]

  def save
    @@record.prepend(self)
  end

  def destroy
    course = @@record.find { |course| course == self }
    course.deleted_at = Time.now if course
  end

  def display
    puts "ID: #{@id}"
    puts "Course Name: #{@name}"
    puts "===============\n"
  end

  def students
    Student.all.select { |student| student.course_id == self.id }
  end

  def subjects
    course_subjects = CourseSubject.all.select { |course_subject| course_subject.course_id == self.id }
    subjects = []
    course_subjects.each do |course_subject| 
      subjects.prepend(Subject.find(course_subject.subject_id))
    end
    subjects
  end

  def self.all
    @@record.select { |course| !course.deleted_at }
  end

  def self.first(query)
    query ? @@record[0..query - 1].each { |course| course.display unless course.deleted_at }
      : self.all.each { |course| course.display unless course.deleted_at }
  end

  def self.find(id)
    @@record.find { |course| course.id == id && !course.deleted_at }
  end

  def self.find_by_email(email)
    @@record.find { |course| course.email = email && !course.deleted_at }
  end
end