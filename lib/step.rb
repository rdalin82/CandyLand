class Step
	attr_reader :colors 
	def initialize
		@colors = ['pink', 'purple', 'yellow', 'blue', 'orange', 'green']
	end 

	def step_color
		@colors.sample
	end 
end 