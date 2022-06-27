def startup_checks
	begin
		# Checking folder structure
		config_folder = "#{$application_root}/config/"
		log_folder = "#{$application_root}/log/"
		Dir.mkdir("#{config_folder}") unless Dir.exist?("#{config_folder}")
		Dir.mkdir("#{log_folder}") unless Dir.exist?("#{log_folder}")
		
		# Put logic here for everything that needs to be done during startup
		# i.e Loading in configuration information from the config folder
	rescue StandardError => error
		error_message = "Error in lib/startup.rb method startup_checks - #{error}"
		log(error_message, "error", "FATAL")
	end
end