require_relative './card'
require_relative './step'

Player = Struct.new(:location, :name, :step, :stuck)
class CandyLand 
	attr_reader :cards, :steps, :turn
	def initialize
	  @cards = []
		@steps = []
		@turn = 0
		setup
	end 
	def move(player)
		@turn += 1
	  if player_stuck?(player)
	  	false
	  else 
			card = @cards.pop

			for i in (player.location+1...@steps.count)
				if @steps[i].color == card.color
					player.location = i
					player.step = @steps[i]
					if stuck?(@steps[i])
						player.stuck = true
					end 
					if won?(player)
						puts "#{player.name} has won in #{turn} turns"
					end
					break				
				end 
			end 
		end 
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
	def player_stuck?(player)
		if player.stuck == true
			player.stuck = false 
			true
		else 
			false 
		end 
	end 

	def stuck?(step)
		if step.special == "sticky"
			true 
		else 
			false
		end 
	end 
	def won?(player)
		if player.location >= 99
			true 
		else 
			false 
		end 
	end 
end 