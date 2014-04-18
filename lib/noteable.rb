require_relative 'note'
require_relative 'parser'
require_relative 'view'
require 'pathname'

module NoteAble
  def self.find_all_and_print
    View.render_page { return_notes parse_files }
  end

  private

  def self.parse_files notes = []
    Dir['**/*'].each do |file|
      notes << (Parser.parse file).map! { |note| Note.new(note) } unless Pathname.new(file).directory?
    end

    filter_notes notes
  end

  def self.filter_notes notes = []
    notes.reject! { |file_notes| file_notes.length == 0 }
    notes.flatten.group_by { |note| note.filepath }
  end

  def self.return_notes notes
    notes.each do |filepath, notes|
      View.render_file filepath
      notes.each { |note| View.render_note note.to_s }
    end
  end
end
