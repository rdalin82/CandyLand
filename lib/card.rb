CardItem = Struct.new(:color, :special) 
class Card
	
	def initialize 
		@colors = ['pink', 'purple', 'yellow', 'blue', 'orange', 'green']
		@specials = []
		@sticky = ['purple', "yellow", "blue", "green", 'orange']
		2.times do 
			@specials.push("candy cane")
			@specials.push("candy cane reverse")
			@specials.push("gumdrop")
			@specials.push("gumdrop reverse")
		end
		
	end 

	def card_color
		if !@specials.empty? 
			CardItem.new("pink", @specials.pop)
		elsif !@sticky.empty?
			CardItem.new(@sticky.pop, "sticky")
		else 
			CardItem.new(@colors.sample, nil)
		end 
	end 
end 