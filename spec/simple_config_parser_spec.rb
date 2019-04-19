require 'spec_helper'

describe SimpleConfigParser do
	describe "#new" do
		it "should print out hello world" do
			expect(STDOUT).to receive(:puts).with('new SimpleConfigParser created')
			parser = SimpleConfigParser.new
		end
	end
end