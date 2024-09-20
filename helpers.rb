module Helper
  def clear_console
    system('clear')
  end

  def add_delete_prompt(title)
    puts "Choose an option below:\n"
    puts "(1) Add #{title}\n(2) Delete #{title}\n(3) Show #{title}\n(4) Update #{title}\n(5) Back To School Management"
    gets.chomp
  end
end