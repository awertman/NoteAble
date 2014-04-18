class View
  @width = 70

  def self.render_page
    system 'clear'
    puts
    puts '-' * @width
    puts 'You have some NoteAble comments in your file...'.center(@width)
    puts '-' * @width

    yield
    
    puts
    puts '-' * @width
    puts 'Made with <3.. by Carolyn Phil James Aaron'.center(@width)
    puts '-' * @width
  end

  def self.render_file(file)
    puts
    puts ' ' * 3 + "#{file}"
  end

  def self.render_note(note)
    str = ' ' * 5 + "#{note}".rjust(5)
    puts str.length > @width ? str.slice(0, @width - 4) + '...' : str
  end
end
