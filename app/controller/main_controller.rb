# Required ruby code
require "#{$application_root}/app/view/main_view.rb"
require "#{$application_root}/app/model/main_model.rb"

class MainController
	def initialize
		@main_view = MainView.new(self)
		@main_model = MainModel.new
	end

	def start_application
		@main_view.show
	end

	def program_information_method
		Tk::messageBox :type => 'ok', :message => $program_information, :icon => 'info', :title => 'Program Information'
	end

	def program_license_method
		Tk::messageBox :type => 'ok', :message => $license, :icon => 'info', :title => 'Program License'
	end
	  
	def browse_method
		location = Tk.chooseDirectory
		if location != ""
			@main_model.set_location(location)
			@main_model.set_status("Location was set!!")
		end
		sync_with_view
	end

	def on_close(view)
		view.withdraw # Hides window
		sleep(10)
		view.deiconify # Reveals the window
	end

	private
		def sync_with_view
			@main_view.set_status(@main_model.get_status)
			@main_view.set_entry_link(@main_model.get_location)
		end
end