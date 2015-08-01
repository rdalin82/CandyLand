require 'minitest/autorun'
require_relative '../lib/game' 

describe CandyLand do 
	before do 
		@game = CandyLand.new
		@game.create_cards
	end 

	describe "when the game is created it creates 64 cards" do 
		it "should have 64 cards" do 
			
			assert_equal @game.cards.count, 64
		end 
	end 

	describe "when the game is created there should be 100 steps" do 
		it "should have 100 steps" do 
			assert_equal @game.steps.count, 100
		end 
	end 

	describe "when the game is created it should have right number of pink cards" do 
		it "should have 2 pink candy cane cards" do 
			assert_equal @game.cards.values.count("pink candy cane"), 2
		end 

		it "should have 2 pink gumdrop cards" do 
			assert_equal @game.cards.values.count("pink gumdrop"), 2
		end

		it "should have 2 pink candy cane reverse cards" do
		  assert_equal @game.cards.values.count("pink candy cane reverse"), 2 
		end  

		it "should have 2 pink gumdrop reverse cards" do
			assert_equal @game.cards.values.count("pink gumdrop reverse"), 2
		end 
	end 


end 
