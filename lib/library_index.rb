# The purpose of this file is to organize and import all library files cleanly.
# Keeping each library as single purpose helps maintainability and testing 
#
# Make each library do one thing and one thing well. - Unix philosophy

# Including standard libraries
require 'tk'
require 'openssl'
require 'base64'

# Including all the custom library files, there is a way to add everything
# in the folder at once. Doing it manually was deliberate so that developers
# know exactly what is added in what exact order.
require "#{$application_root}/lib/logging.rb" # This is first so that we can log
require "#{$application_root}/lib/colors.rb"
require "#{$application_root}/lib/configuration_management.rb"
require "#{$application_root}/lib/detect_os.rb"
require "#{$application_root}/lib/encryption.rb"
require "#{$application_root}/lib/startup.rb"