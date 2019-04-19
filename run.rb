require './simple_config_parser'

parser = SimpleConfigParser.new
config = parser.parse_file

puts config.inspect