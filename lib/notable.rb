module Notable
	def self.find_all_and_print
		View.render_page { render_notes get_notes }
	end

	private
	def self.get_notes
		notes = Parser.Parser.group_by { |note| note.filepath }
	end

	def self.render_notes notes
		notes.each do |filepath, notes|
			View.render_file filepath
			notes.each { |note| View.render_note note.to_s }
		end
	end
end