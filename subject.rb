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
end