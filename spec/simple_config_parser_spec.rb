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

	describe "#parse_line" do
		[
			'this is just text',
			'foo=',
			'=bar',
			'foo = bar=baz'
		].each do |line|
			it "should error on invalid line" do
				parser = SimpleConfigParser.new

				expect{output = parser.parse_line(line)}.to raise_error(StandardError)
			end
		end

		{
			'foo=bar' => ['foo', 'bar'],
			'baz = bip' => ['baz', 'bip']
		}.each do |line, expected_output|
			it "should return array on valid line" do
				parser = SimpleConfigParser.new

				output = parser.parse_line(line)

				expect(output).to eq(expected_output)
			end
		end
	end
end