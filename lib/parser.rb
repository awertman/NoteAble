module Parser
  def self.parse file_path
    @file_path = file_path
    @matches = []
    parse_matches
    filter_matches
  end

  private

  def self.parse_matches
    File.open(@file_path, 'r:ASCII-8BIT').each_with_index do |content, index|
      @matches << { filepath: @file_path,
                    note: content,
                    line: index } if content =~ $pattern
    end
  end

  def self.filter_matches
    @matches.each { |match| match[:note].gsub!($pattern, '\3').strip! }
  end
end
