class Note
  @@count = 0
  attr_reader :filepath, :note, :line, :id

  def initialize args
    @id = get_id
    @filepath = args[:filepath]
    @note = args[:note]
    @line = args[:line]
  end

  def get_id
    @id = @@count
    @@count += 1
  end

  def to_s
    str = ""
    str << "#{@line}".rjust(5) + ": "
    str << "#{note} <#{id}>"
  end
end
