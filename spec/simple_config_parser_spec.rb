require 'spec_helper'

describe SimpleConfigParser do
	describe "#new" do
		it "should load a config file" do
			ex_config_file = './config.txt'
			new_config_file = './config2.txt'

			parser = SimpleConfigParser.new
			parser2 = SimpleConfigParser.new(new_config_file)

			expect(parser.config_file).to eq(ex_config_file)
			expect(parser2.config_file).to eq(new_config_file)
		end

		it "should throw exception if config file doesn't exist" do
			ex_config_file = './config3.txt'

			expect{parser = SimpleConfigParser.new(ex_config_file)}.to raise_error(IOError)
		end
	end
end