require_relative './card'
require_relative './step'

Player = Struct.new(:location, :name, :step)
class CandyLand 
	attr_reader :cards, :steps
	def initialize
	  @cards = []
		@steps = []
		setup
	end 
	def move(player)
		card = @cards.pop
		#puts "card is #{card}"
		#puts "Player current location is #{player.location}"
		for i in (player.location+1...@steps.count)
			if @steps[i].color == card.color
				player.location = i
				player.step = @steps[i]
				if player.location == 99
					puts "#{player.name} has won"
				end
				break
			end 
		end 
		#puts "player location now is #{player.location}"
		#puts "on step #{player.step}"
		#puts ""
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