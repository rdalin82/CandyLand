class Card
	
	def initialize 
		@colors = ['pink', 'purple', 'yellow', 'blue', 'orange', 'green']
		@specials = []
		@sticky = ['purple sticky', "yellow sticky", "blue sticky", "green sticky", 'orange sticky']
		2.times do 
			@specials.push("pink candy cane")
			@specials.push("pink candy cane reverse")
			@specials.push("pink gumdrop")
			@specials.push("pink gumdrop reverse")
		end 
	end 

	def card_color
		if !@specials.empty? 
			@specials.pop
		elsif !@sticky.empty?
			@sticky.pop
		else 
			@colors.sample
		end 
	end 
end 