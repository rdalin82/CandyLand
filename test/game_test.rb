require 'minitest/autorun'
require_relative '../lib/game' 

describe CandyLand do 
	before do 
		@game = CandyLand.new
	end 

	describe "when the game is created it creates 64 cards" do 
		it "should have 64 cards" do 
			@game.create_cards
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
			@game.create_cards
			assert_equal @game.cards.values_at("pink candy cane").count, 2
		end 

		it "should have 2 pink gumdrop cards" do 
			assert_equal @game.cards.values_at("pink gumdrop").count, 2
		end 
	end 


end 
