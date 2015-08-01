require_relative './card'
require_relative './step'

class CandyLand 
	attr_reader :cards, :steps
	def initialize
	  @cards = []
		@steps = []
		100.times { |x| @steps << Step.new.step_color }
	end 

	def create_cards(card_number=64, card = Card.new)
		card_number.times do |x|
			@cards << card.card_color
		end 
		@cards.shuffle
	end 

	def create_steps(step_number=100)
	end 

end 