require_relative './card'
require_relative './step'

class CandyLand 
	attr_reader :cards, :steps
	def initialize#(card_number=64, step_number=100)
	  @cards = {}
		#card_number.times { |x| @cards[x] = Card.new }
		@steps = []
		100.times { |x| @steps << Step.new.step_color }
	end 

	def create_cards(card_number=64, card = Card.new)
		card_number.times do |x|
			@cards[x] = card.card_color
		end 
		@cards
	end 

	def create_steps(step_number=100)
	end 

end 