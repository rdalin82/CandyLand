require_relative './card'
require_relative './step'

class CandyLand 
	attr_reader :cards, :steps
	def initialize
	  @cards = []
		@steps = []
		setup
	end 


	private

	def create_cards(card_number=64, card = Card.new)
		card_number.times do
			@cards << card.card_color
		end 
		@cards.shuffle!(random: Random.new(card_number))
	end 

	def create_steps(step_number=100, step = Step.new)
		step_number.times do
			@steps << step.step_color
		end 
		@steps.shuffle!(random: Random.new(step_number))
	end 

	def setup 
		create_cards
		create_steps
	end 
end 