class View

  def self.render_page
    puts ""
    yield
  end

  def self.render_file(file)
    puts "#{file}"
  end

  def self.render_note(note)
    puts "#{note}"
  end
end
