require_relative './card'
require_relative './step'

class CandyLand 
	attr_reader :cards, :steps
	def initialize
	    @cards = [] 
		64.times { |x| @cards << Card.new }
		@steps = []
		100.times { |x| @steps << Step.new }
	end 

end 