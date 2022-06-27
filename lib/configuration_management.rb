def load_configuration_data
	begin
		if File.exist?("#{$application_root}/config/location.data")
			$entry_link.delete("0", "end")
			$entry_link.insert('end', decrpyt_file("location.data"))
		end
	rescue StandardError => e
		$label_error.text = "There was an unspecified error"
		output_to_log("Error in lib/.support_methods.rb method load_data")
		output_to_log(e)
	end
end

def save_configuration_data
	begin
		if File.exist?("#{$application_root}/config/location.data")
			$entry_link.delete("0", "end")
			$entry_link.insert('end', decrpyt_file("location.data"))
		end
	rescue StandardError => e
		$label_error.text = "There was an unspecified error"
		output_to_log("Error in lib/.support_methods.rb method load_data")
		output_to_log(e)
	end
end