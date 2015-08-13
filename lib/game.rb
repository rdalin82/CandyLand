require_relative './card'
require_relative './step'

class Player < Struct.new(:location, :move, :step)
	def initialize(location, move="normal", step=nil); super end 
end 
class CandyLand 
	attr_reader :cards, :steps, :turn
	def initialize
	  @cards = []
		@steps = []
		@turn = 0
		setup
	end 

	def start
		player = Player.new(0)
		until won(player)
			move(player)
		end 
	end 
	def move(player)
		@turn += 1
		public_send("#{player.move}_move".to_sym, player)
	rescue NoMethodError
		puts "no method"
		normal_move(player)
	ensure 
		puts "player won in #{turn} turns" if won(player) 
	end 
		 
	def normal_move(player)
		card = @cards.pop
		for i in (player.location+1...@steps.count)
			if @steps[i].color == card.color
				player.location = i
				player.step = @steps[i]
				break	
			end 
		end 
	end

	def stuck_move(player)
		player.move = "normal"
	end 

	def reverse_move(player)
		card = @cards.pop
		for i in (player.location-1).downto(0) 
			if @steps[i].color == card.color
				player.location = i
				player.step = @steps[i]
				break	
			end 
		end 
		player.move = "normal" 
	end 

	def won(player)
		player.location == 99
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