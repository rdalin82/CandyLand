StepItem = Struct.new(:color, :special)
class Step
	attr_reader :colors 
	def initialize
		@colors = ['pink', 'purple', 'yellow', 'blue', 'orange', 'green']
		@special = ['gumdrop', 'candy cane']
		@sticky = {}
		@colors.each do |color|
			@sticky[color] = "sticky"
		end 
		@sticky.keep_if {|x| x != "pink" }
	end 

	def step_color
		color = @colors.sample
		if !@sticky.empty?
			arr = @sticky.shift
			StepItem.new(arr[0], arr[1])
		elsif color == "pink" 
			StepItem.new("pink", @special.sample)
		else 
			StepItem.new(color, nil)
		end 
	end 
end 