module Helper
  def clear_console
    system('clear')
  end

  def add_delete_prompt(title)
    puts "Choose an option below:\n"
    puts "(1) Add #{title}\n(2) Delete #{title}\n"
    gets.chomp
  end
end