class Course
  attr_accessor :id, :name

  def initialize(id = nil, name = nil)
    @id = id
    @name = name
  end

  @@record = []

  def save
    @@record.prepend(self)
  end

  def self.first(query)
    query ? @@record[0..query - 1].each { |course| course.display } : self.all.each { |course| course.display }
  end

  def destroy
    @@record.delete(self)
  end

  def display
    puts "===============\n"
    puts "ID: #{@id}"
    puts "Name: #{@name}"
    puts "===============\n"
  end

  def self.all
    @@record
  end

  def self.find(id)
    @@record.find { |student| student.id == id }
  end
end