def encrpyt_file filename, data
		begin
			Dir.mkdir("#{$application_root}/config") unless Dir.exist?("#{$application_root}/config")
			cipher = OpenSSL::Cipher::AES.new(256, :CBC)
			cipher.encrypt
			if !File.exist?("#{$application_root}/config/encryption_key.data")
				key = cipher.random_key
				cipher.key = key
				encryption_key_file = File.new("#{$application_root}/config/encryption_key.data", "w")
				encryption_key_file.puts(Base64.strict_encode64(key))
				encryption_key_file.close
			else
				encryption_key_file = File.open("#{$application_root}/config/encryption_key.data", "r")
				key = Base64.strict_decode64(encryption_key_file.gets.chomp)
				cipher.key = key
				encryption_key_file.close
			end
	
			File.delete("#{$application_root}/config/#{filename}") if File.exist?("#{$application_root}/config/#{filename}")
			file = File.new("#{$application_root}/config/#{filename}", "w")
			data = cipher.update(data) + cipher.final
			file.puts(Base64.strict_encode64(data))
			file.close
		rescue StandardError => e
			$label_error.text = "There was an unspecified error"
			output_to_log("Error in lib/.support_methods.rb method encrpyt_file filename, data")
			output_to_log(e)
		end
	end
	
	def decrpyt_file filename
		begin
			if File.exist?("#{$application_root}/config/encryption_key.data")
				encryption_key_file = File.open("#{$application_root}/config/encryption_key.data", "r")
				encryption_key = Base64.strict_decode64(encryption_key_file.gets.chomp)
				encryption_key_file.close
	
				file = File.open("#{$application_root}/config/#{filename}", "r")
				encrypted_data = Base64.strict_decode64(file.gets.chomp)
				file.close
	
				cipher = OpenSSL::Cipher.new('aes-256-cbc')
				cipher.decrypt
				cipher.key = encryption_key
				decrypted_data = cipher.update(encrypted_data) + cipher.final
				return decrypted_data
			else
				return "Encryption key missing"
			end
		rescue StandardError => e
			output_to_log("Error in lib/.support_methods.rb method decrpyt_file filename")
			output_to_log(e)
		end
	end