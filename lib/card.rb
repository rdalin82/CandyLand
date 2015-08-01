class Card
	
	def initialize 
		@colors = ['pink', 'purple', 'yellow', 'blue', 'orange', 'green']
		@specials = ["pink candy cane", "pink candy cane", "pink gumdrop", "pink gumdrop"]
	end 

	def card_color
		if !@specials.empty? 
			@specials.pop
		else 
			@colors.sample
		end 
	end 
end 