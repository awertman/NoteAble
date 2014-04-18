require_relative 'note'
require_relative 'parser'
require_relative 'view'

include parser
include view

module Notable
	def self.find_all_and_print
		View.render_page { render_notes get_notes }
	end

	private
	def self.get_notes
		notes = build_notes(Parser.parse).group_by { |note| note.filepath }
	end

	def self.render_notes notes
		notes.each do |filepath, notes|
			View.render_file filepath
			notes.each { |note| View.render_note note.to_s }
		end
	end

	def self.build_notes data_from_files
		data.flatten.map { |data_from_files| Note.new data_from_files }
	end
end