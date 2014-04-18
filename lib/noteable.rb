require_relative 'note'
require_relative 'parser'
require_relative 'view'
require 'pathname'

module NoteAble
	def self.find_all_and_print
		View.render_page { render_notes group_by_file(parse_files) }
	end

	def self.open id
		exec "subl #{parse_files.find { |note| note.id == id.to_i }.filepath}"
	end

	private

  def self.parse_files notes = []
    Dir['**/*'].each do |file|
      notes << (Parser.parse file).map! { |note| Note.new(note) } unless Pathname.new(file).directory?
    end
    filter_empty_notes notes
  end

  def self.filter_empty_notes notes = []
    notes.reject! { |file_notes| file_notes.length == 0 }.flatten
  end

  def self.group_by_file notes
    notes.group_by { |note| note.filepath }  	
  end

  def self.render_notes notes
    notes.each do |filepath, notes|
      View.render_file filepath
      notes.each { |note| View.render_note note.to_s }
    end
  end
end
