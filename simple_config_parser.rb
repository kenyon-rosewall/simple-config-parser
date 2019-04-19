class SimpleConfigParser
	attr_accessor :config_file

	def initialize(filename = './config.txt')
		@config_file = filename
		@config = {}

		if !File.exists?(@config_file)
			raise IOError, "Config file not found"
		end
	end

	def parse_line(line)
		# First catch commented out and blank lines
		if line.strip == ''
			return
		end
		if line =~ /^\s*#.*/
			return
		end

		# A correctly formatted line will include an assignment operator, here =
		# Stripping each value in the array will get rid of extra white space
		config_arr = line.split('=').map(&:strip)

		# Either too few or too many values in the line, error
		if config_arr.count != 2
			raise StandardError, "Line is not formatted correctly"
		end
		# If a value wasn't set on either side of the assignment operator, error
		if config_arr[0] == '' or config_arr[1] == ''
			raise StandardError, "Line is not formatted correctly"
		end

		# Assuming only the value needs to be explicitly typed, return the correct value type
		if config_arr[1] =~ /^[0-9]+$/
			config_arr[1] = config_arr[1].to_i
		elsif config_arr[1] =~ /^[0-9]+\.[0-9]+$/
			config_arr[1] = config_arr[1].to_f
		elsif config_arr[1].downcase == 'true' or config_arr[1].downcase == 'yes' or config_arr[1].downcase == 'on'
			config_arr[1] = true
		elsif config_arr[1].downcase == 'false' or config_arr[1].downcase == 'no' or config_arr[1].downcase == 'off'
			config_arr[1] = false
		end 

		# Return the cleaned array of key,value
		config_arr
	end
end