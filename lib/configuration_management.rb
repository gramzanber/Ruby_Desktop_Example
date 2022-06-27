def load_configuration_data config_name
	begin
		config_file = "#{$application_root}/config/#{config_name}.data"
		data = File.exist?(config_file) ? decrpyt_file(config_file) : "Config file not found."
		return data
	rescue StandardError => error
		error_message = "Error in lib/configuration_management.rb method load_configuration_data - #{error}"
		log(error_message, "error", "FATAL")
	end
end

# This method replaces the config file
def save_configuration_data config_name, data
	begin
		config_file = "#{$application_root}/config/#{config_name}.data"
		File.delete(config_file) if File.exist?(config_file)
		encrpyt_file(config_file, data)
		return true
	rescue StandardError => error
		error_message = "Error in lib/configuration_management.rb method save_configuration_data - #{error}"
		log(error_message, "error", "FATAL")
	end
end