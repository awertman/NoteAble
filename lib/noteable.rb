require_relative 'note'
require_relative 'parser'
require_relative 'view'

module NoteAble
	def self.find_all_and_print
		View.render_page { render_notes parse_files }
	end

	def self.open id
		exec "subl #{parse_files.find { |note| note.id == id.to_i }.filepath}"
	end

	private
	def self.parse_files(notes=[])
		Dir["**/*"].each do |file|
			if (file =~ /\./) && (file !~ /(\.gem)/)
				notes << (Parser.parse file).map! { |note| Note.new(note) }
			end
		end
		notes.reject! { |file_notes| file_notes.length == 0 }.flatten!
		notes
	end

	def self.render_notes notes
		notes = notes.flatten.group_by { |note| note.filepath }
		notes.each do |filepath, notes|
			View.render_file filepath
			notes.each { |note| View.render_note note.to_s }
		end
	end

	def self.build_notes files
		files.flatten.map { |data| Note.new data }
	end

	# def self.get_files directory
	# 	directory.each { |file| }
	# end
end