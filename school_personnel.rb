class SchoolPersonnel
  attr_accessor :id, :name, :birth_date, :email, :phone_number, :deleted_at

  def initialize(id = nil, name = nil, birth_date = nil, email = nil, phone_number = nil, deleted_at = nil)
    @id = id
    @name = name
    @birth_date = birth_date
    @email = email
    @phone_number = phone_number
    @deleted_at = deleted_at
  end

  def save
    @@record.prepend(self)
  end

  def destroy
    school_personnel = @@record.find { |school_personnel| school_personnel == self }
    school_personnel.deleted_at = Time.now if school_personnel
  end

  def display
    puts "ID: #{@id}"
    puts "Name: #{@name}"
    puts "Birth date: #{@birth_date}"
    puts "Email: #{@email}"
    puts "Phone number: #{@phone_number}"
  end

  def self.all
    @@record.select { |school_personnel| !school_personnel.deleted_at }
  end

  def self.first(query)
    query ? @@record[0..query - 1].each { |school_personnel| school_personnel.display unless school_personnel.deleted_at }
      : self.all.each { |school_personnel| school_personnel.display unless school_personnel.deleted_at }
  end

  def self.find(id)
    @@record.find { |school_personnel| school_personnel.id == id && !school_personnel.deleted_at }
  end

  def self.find_by_email(email)
    @@record.find { |school_personnel| school_personnel.email = email && !school_personnel.deleted_at }
  end
end