require_relative './card'

class CandyLand 
	attr_reader :cards
	def initialize
	    @cards = [] 
		64.times { |x| @cards << Card.new }
	end 

end 