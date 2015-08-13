require 'minitest/autorun'
require_relative '../lib/game' 

describe CandyLand do 
	before do 
		@game = CandyLand.new

	end 

	describe "when the game is created it creates 64 cards" do 
		it "should have 64 cards" do 
			
			assert_equal @game.cards.count, 64
		end 

		it "should respond to color" do 
			assert_respond_to @game.cards[0], :color
		end 

		it "should respond to special" do 
			assert_respond_to @game.cards[0], :special
		end 
	end 

	describe "when the game is created there should be 100 steps" do 
		it "should have 100 steps" do 
			assert_equal @game.steps.count, 100
		end 
	end 

	describe "when the game is created it should have right number of pink cards" do 
		it "should have 2 pink candy cane cards" do 
			count = @game.cards.select {|x| x.special == "candy cane"}
			assert_equal count.count, 2
		end 

		it "should have 2 pink gumdrop cards" do 
			count = @game.cards.select {|x| x.special == "gumdrop"}
			assert_equal count.count, 2
		end

		it "should have 2 pink candy cane reverse cards" do
		  count = @game.cards.select {|x| x.special == "candy cane reverse"}
			assert_equal count.count, 2 
		end  

		it "should have 2 pink gumdrop reverse cards" do
			count = @game.cards.select {|x| x.special == "gumdrop reverse" }
			assert_equal count.count, 2
		end 
	end

	describe "Given the game is started" do
		it "should respond to the move method" do 
			assert_respond_to @game, :move 
		end 
		it "should draw a card and move the player to the next step" do 
			player1 = Player.new(0)
			@game.move(player1)
			refute_equal player1.location, 0
		end 
		it "should reduce card size when game moves player" do 
			player1 = Player.new(0)
			@game.move(player1)
			refute_equal @game.cards.count, 64
		end 
		it "should respond to reverse" do 
			player = Player.new(12)
			player.move = "reverse" 
			current_location = player.location
			@game.move(player)
			assert_operator current_location, :>,  player.location
		end 

		it "should unreverse a player" do 
			player = Player.new(12)
			player.move = "reverse" 
			@game.move(player)
			refute_equal player.move, "reverse" 
		end 
		it "should respond to sticky" do 
			player = Player.new(12)
			player.move = "stuck" 
			current_location = player.location
			@game.move(player)
			assert_equal 12, player.location
			assert_equal 1, @game.turn
		end 
		it "stuck move should unstick player" do 
			player = Player.new(12)
			player.move = "stuck" 
			@game.move(player)
			refute_equal player.move, "stuck" 
		end 
	end 
	describe 'it should know if a player won' do
		it 'should identify a won player' do 
			player = Player.new(99)
			result = @game.won(player)
			assert_equal true, result 
		end 

		it "should identify a non won player" do 
			player = Player.new(98)
			result = @game.won(player)
			refute_equal true, result 
		end 
	end 
end 
