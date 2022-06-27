def log(message, log_name, error_level = "INFO")
	begin
		log_folder = "#{$application_root}/log/"
		log_name = log_name + ".log"
		log_location = "#{log_folder}#{log_name}"
		time = Time.new.strftime("%Y-%m-%d %H:%M:%S")
		file = File.open("#{log_location}", "a")
		file.puts("#{error_level.upcase},#{time},#{message}")
		file.close if file != nil
		# size is in bytes, 1024 * 1024 is a megabyte
		roll_log(log_name) if File.size("#{log_location}") > (1024 * 1024)
	rescue StandardError => error
		puts("Error in lib/logging.rb method log")
		puts("Error: #{error}")
	end
end

def roll_log(log_name)
	begin
		log_folder = "#{$application_root}/log/"
		log_location = "#{log_folder}#{log_name}"
		number_of_logs = 0
		Dir.children("#{log_folder}").each do |filename|
			number_of_logs = number_of_logs + 1 if filename.includes?(log_name)
		end
		old_log_name = number_of_logs < 10 ? "#{long_name}_0#{number_of_logs.to_s}.log" :
			"#{long_name}_#{number_of_logs.to_s}.log"
		File.rename("#{log_name}", "#{path}#{old_log_name}")
	rescue StandardError => error
		error_message = "Error in lib/logging.rb method roll_log - #{error}"
		log(error_message, "error", "WARN")
	end
end