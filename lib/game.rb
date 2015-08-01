require_relative './card'
require_relative './step'

class CandyLand 
	attr_reader :cards, :steps
	def initialize(card_number=64, step_number=100)
	    @cards = [] 
		card_number.times { |x| @cards << Card.new }
		@steps = []
		step_number.times { |x| @steps << Step.new }
	end 

end 