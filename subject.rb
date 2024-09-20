class Subject
  attr_accessor :id, :name

  def initialize(id = nil, name = nil)
    @id = id
    @name = name
  end

  @@record = [
    Subject.new(1, 's1'),
    Subject.new(2, 's2'),
    Subject.new(3, 's3'),
  ]

  def save
    @@record.prepend(self)
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

  def self.first(query)
    query ? @@record[0..query - 1].each { |subject| subject.display } : self.all.each { |subject| subject.display }
  end

  def self.find(id)
    @@record.find { |subject| subject.id == id }
  end
end