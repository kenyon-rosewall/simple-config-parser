class SimpleConfigParser
	attr_accessor :config_file

	def initialize(filename = './config.txt')
		@config_file = filename
		if !File.exists?(@config_file)
			raise IOError, "Config file not found"
		end
	end
end