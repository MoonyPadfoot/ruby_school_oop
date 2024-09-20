class Subject
  attr_accessor :id, :name, :deleted_at

  def initialize(id = nil, name = nil, deleted_at = nil)
    @id = id
    @name = name
    @deleted_at = deleted_at
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
    subject = @@record.find { |subject| subject == self }
    subject.deleted_at = Time.now if subject
  end

  def display
    puts "ID: #{@id}"
    puts "Name: #{@name}"
    puts "===============\n"
  end

  def self.all
    @@record.select { |subject| !subject.deleted_at }
  end

  def self.first(query)
    query ? @@record[0..query - 1].each { |subject| subject.display unless subject.deleted_at }
      : self.all.each { |subject| subject.display unless subject.deleted_at }
  end

  def self.find(id)
    @@record.find { |subject| subject.id == id && !subject.deleted_at }
  end

  def self.find_by_email(email)
    @@record.find { |subject| subject.email = email && !subject.deleted_at }
  end
end