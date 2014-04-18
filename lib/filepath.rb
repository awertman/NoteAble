class FilePath
	@@count = 0
	attr_reader :filepath, :id
	def initialize filepath 
		@id = get_id
		@filepath = filepath
	end

	def get_id
		@id = @@count
		@@count += 1
	end

	def to_s
		str = ""
		str << "#{@id}. "
		str << "#{@filepath}".rjust(5) + ": "
	end
end