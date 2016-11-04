class Timer
	attr_accessor :seconds
    
	def initialize
		@seconds = 0
	end
    
	def time_string
		hours = @seconds/3600
		remains = @seconds%3600
		sprintf("%02d:%02d:%02d", hours, remains/60, remains%60)
	end


end
