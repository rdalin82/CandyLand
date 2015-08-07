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


	describe "Step should have EITHER candy cane or gumdrop label not both" do 
		it "should have candy cane" do 
			@game.steps.each do |x|
				if x.color.match("pink")
					assert_equal x.special, "candy cane"
				end
			end  
		end 
		it "should have gumdrop" do 
			@game.steps.each do |y|
				if y.color.match("pink")
					assert_equal y.special, "pink gumdrop"
				end 
			end 
		end 
	end 

end 
