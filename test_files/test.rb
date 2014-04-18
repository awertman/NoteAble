require_relative 'lib/note'
require_relative 'lib/parser'

@notes = []

all_files_folders = Dir["**/*"]

Dir["**/*"].each do |file| 
  if file != 'lib'
    @notes << (Parser.parse file).map! { |note| Note.new(note) }
  end
end

@notes.reject! {|file_notes| file_notes.length == 0}
@notes.flatten!.each { |note| p note }