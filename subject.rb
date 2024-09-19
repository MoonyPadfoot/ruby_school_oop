class Subject
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
    puts "===============\n"
  end

  def self.all
    @@record
  end

  def self.find(id)
    @@record.find { |subject| subject.id == id }
  end
end