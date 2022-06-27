# Starting application
This program can be run from the start.cmd or start.sh
Windows users that want to start the application without a console window should run the {application name}.vbs

# Development
You are going to want to set the main application variables in the main.rbw file
You should set your own icon's for the application
	- The main icon should be 50x50 in size and goes in assets/image
	- The icon should be renamed to application_name_50.png 
	- You also need a .ico image at the root size 96x96 for the desktop icon
	- The .ico should be rename to match the application name
Once ready for deployment make sure you change the name of the .vbs for Windows users to {application name.vbs}
Before deployment delete this Readme.txt and rename project_information.txt to Readme.txt
For refrence update the Gemfile with the gems used in this application
Make sure all require's that are not part of the MVC design are in the lib folder
	- All require's are added within the library_index.rb file for ease of import

# Remember the Unix philosophy and have fun
# Nathanial Tachibana