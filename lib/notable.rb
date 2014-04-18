require_relative 'note'
require_relative 'parser'
require_relative 'view'

# include parser
# include view

module Notable
	def self.find_all_and_print directory
		View.render_page { render_notes get_notes directory}
	end

	private
	def self.get_notes directory
		notes = []
		Dir["**/*"].each do |file|
			if file =~ /\./ #!= 'lib' && file != 'bin' && file != 'test_files'
				notes << (Parser.parse file).map! { |note| Note.new(note) }
			end
		end
		notes.reject! {|file_notes| file_notes.length == 0}
		notes.flatten.group_by { |note| note.filepath }
	end

	def self.render_notes notes
		notes.each do |filepath, notes|
			View.render_file filepath
			notes.each { |note| View.render_note note.to_s }
		end
	end

	def self.build_notes files
		files.flatten.map { |data| Note.new data }
	end

	def self.get_files directory
		directory.each { |file| }
	end
end