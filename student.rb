class Student
  attr_accessor :id, :name, :birth_date, :email, :phone_number

  @@record = []

  def save
    @@record.prepend(self)
  end


end