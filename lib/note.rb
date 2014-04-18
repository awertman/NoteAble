class Note
  attr_reader :filepath, :note, :line

  def initialize args
    @filepath = args[:filepath]
    @note = args[:note]
    @line = args[:line]
  end

  def to_s
    str = ''
    str << "#{@line}".rjust(5) + ': '
    str << "#{note}"
  end
end
