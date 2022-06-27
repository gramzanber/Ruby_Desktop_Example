class MainModel
	def initialize
		@location = ""
		@status = ""
	end

	def set_location(location)
		@location = location
	end

	def get_location
		return @location
	end

	def set_status(status)
		@status = status
	end

	def get_status
		return @status
	end
end