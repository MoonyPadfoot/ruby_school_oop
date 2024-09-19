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

  def destroy
    @@record.delete(self)
  end

  def display
    puts "ID: #{@id}"
    puts "Name: #{@name}"
    puts "==============="
  end

  def self.all
    @@record
  end
end