require 'colorize'

class View
  @width = 70

  def self.render_page
    system 'clear'
    header
    puts
    puts
    puts "To open file in Sublime: '$ notable #'".center(@width).light_magenta
    puts
    yield
    puts
    puts
    footer
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
    puts
    puts ('-' * @width).yellow
    puts 'The following commands work with NoteAble'.center(@width).green
    puts ('-' * @width).yellow
    puts <<-eos
      -h, --help
      -s, --settings                   Alter settings
      -v, --version                    Display version
      -t, --tag TAG                    Personalize tag message
    eos
    puts
  end

  def self.version
    puts 'Version: 0.0.3'
  end

  def self.header
    puts
    puts ('-' * @width).yellow
    puts 'You have some NoteAble comments in your file...'.center(@width).green
    puts ('-' * @width).yellow
  end

  def self.footer
    puts ('-' * @width).yellow
    puts 'Made with <3.. by Carolyn Phil James Aaron'.center(@width)
    puts ('-' * @width).yellow
    puts
  end

end
