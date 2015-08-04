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

	describe "when the game is created there should be 100 steps" do 
		it "should have 100 steps" do 
			assert_equal @game.steps.count, 100
		end 
	end 

	describe "when the game is created it should have right number of pink cards" do 
		it "should have 2 pink candy cane cards" do 
			assert_equal @game.cards.count("pink candy cane"), 2
		end 

		it "should have 2 pink gumdrop cards" do 
			assert_equal @game.cards.count("pink gumdrop"), 2
		end

		it "should have 2 pink candy cane reverse cards" do
		  assert_equal @game.cards.count("pink candy cane reverse"), 2 
		end  

		it "should have 2 pink gumdrop reverse cards" do
			assert_equal @game.cards.count("pink gumdrop reverse"), 2
		end 
	end

	describe "when game is create it should have 5 sticky cards" do 
		it "should have 5 sticky cards" do 
			count = @game.cards.select { |i| i['sticky'] }
			assert_equal count.count, 5
			end
		end 
	describe "Step should have EITHER candy cane or gumdrop label not both" do 
		it "should have candy cane" do 
			@game.steps.each do |x|
				if x.match("pink candy cane")
					assert_equal x, "pink candy cane"
				end
			end  
		end 
		it "should have gumdrop" do 
			@game.steps.each do |y|
				if y.match("pink gumdrop")
					assert_equal y, "pink gumdrop"
				end 
			end 
		end 
	end 

end 
