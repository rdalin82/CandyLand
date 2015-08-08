require 'minitest/autorun'
require_relative '../lib/step'

describe Step do 
	before do 
		@step = Step.new
	end 

	describe "Should have colors" do 
		it "Should have 6 colors" do 
			assert_equal @step.colors.count, 6
		end 

		it "should have a step color" do 
			assert_respond_to @step, :step_color
		end 
	end
	

end  
