require 'colorize'

class View
  @width = 70

  def self.render_page
    system 'clear'
    puts
    puts ('-' * @width).yellow
    puts 'You have some NoteAble comments in your file...'.center(@width).green
    puts ('-' * @width).yellow
    puts
    puts
    puts "To open file in Sublime: '$ notable #'".center(@width).light_magenta
    puts
    yield
    puts
    puts
    puts ('-' * @width).yellow
    puts 'Made with <3.. by Carolyn Phil James Aaron'.center(@width)
    puts ('-' * @width).yellow
  end

  def self.render_file(file)
    puts
    puts ' ' * 3 + "#{file}"
  end

  def self.render_note(note)
    str = ' ' * 5 + "#{note}".rjust(5)
    puts str.length > @width ? str.slice(0, @width - 4) + '...' : str
  end

  def self.help
    puts <<-eos
      -h, --help
      -s, --settings                   Alter settings
      -v, --version                    Display version
      -t, --tag TAG                    Personalize tag message
    eos
  end

  def self.version
    puts version
  end

end
