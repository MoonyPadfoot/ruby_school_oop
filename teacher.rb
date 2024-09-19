class Teacher
  attr_accessor :id, :name, :birth_date, :email, :phone_number, :department

  def initialize(id = nil, name = nil, birth_date = nil, email = nil, phone_number = nil, department = nil)
    @id = id
    @name = name
    @birth_date = birth_date
    @email = email
    @phone_number = phone_number
    @department = department
  end

  @@record = []

  def save
    @@record.prepend(self)
  end

  def destroy
    @@record.delete(self)
  end
end