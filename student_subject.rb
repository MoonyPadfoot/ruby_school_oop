class StudentSubject
    attr_accessor :id, :student_id, :subject_id

    def initialize(student_id = nil, subject_id = nil)
      @id = @@record.size + 1
      @student_id = student_id
      @subject_id = subject_id
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
      puts "Student ID: #{@student_id}"
      puts "Subject ID: #{@subject_id}"
      puts "===============\n"
    end

    def self.all
      @@record
    end

    def self.find(id)
      @@record.find { |student_subject| student_subject.id == id }
    end
end