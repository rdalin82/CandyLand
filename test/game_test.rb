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


end 
