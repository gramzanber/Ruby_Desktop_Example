def detect_os
	# Checks the Operating System(os)
	if(RUBY_PLATFORM.include?("darwin"))
		os = "MacOS"
	elsif(RUBY_PLATFORM.include?("mswin") || RUBY_PLATFORM.include?("mingw") || RUBY_PLATFORM.include?("cygwin"))
		os = "WindowsOS"
	elsif(RUBY_PLATFORM.include?("cygwin"))
		os = "LinuxOS"
	elsif(RUBY_PLATFORM.include?("freebsd"))
		os = "FreeBSD"
	else
		os = "Not able to detect"
	end
	
	return os
end