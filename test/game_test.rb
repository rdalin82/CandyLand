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
	end 

	describe "when th egame is created there should be 100 steps" do 
		it "should have 100 steps" do 
			assert_equal @game.steps.count, 100
		end 
	end 


end 
