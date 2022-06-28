class MainView
    def initialize(controller)
        # Getting the initial view object
		@root = TkRoot.new

		# Allowing the controller methods to be used in the view
		@controller = controller

		# Set custom application icon
        image = TkPhotoImage.new
        image.file = $application_icon # Global variables are declared in controller/main.rbw
        @root.iconphoto(image)

        @height = 200
        @width = 500

		# Building the main application window
		self.build_main_window
    end

    def show
		@root.mainloop
	end

	def set_entry_link(text)
		@entry_link.delete("0", "end")
		@entry_link.insert('end', text)
	end

	def set_status(text)
		@label_status.text = text
	end

    private
		def build_main_window
			@root.title = $application_name
			@root.minsize(@width,@height)
			@root.resizable 0, 0

			# Overwrite close button 'X'
			#@root.protocol('WM_DELETE_WINDOW', proc{@controller.on_close(@root)})
			
			# Menu
			self.build_menu

			# Frame
			self.build_main	
			self.build_status
		end

        def build_menu
			self.build_file_menu
			self.build_help_menu
			menu_bar = TkMenu.new
			menu_bar.add('cascade',
						'menu'  => @file_menu,
						'label' => "File",
						'underline' => 1)
			menu_bar.add('cascade',
						'menu'  => @help_menu,
						'label' => "Help")
			@root.menu(menu_bar)
		end
  
		def build_file_menu
			@file_menu = TkMenu.new(@root, 'tearoff' => 0)
			# If the tearoff hash is not added then users can rip the menu off into a new window.
			# Notice the dotted line in the help menu when running, and click on it.
	
			@file_menu.add('command',
						'label'     => "Browse",
						'command'   => Proc.new {@controller.browse_method},
						'underline' => 0)
			@file_menu.add('separator')
			@file_menu.add('command',
						'label'     => "Exit",
						'command'   => Proc.new {exit},
						'underline' => 3)
		end
	
		def build_help_menu
			@help_menu = TkMenu.new(@root)
	
			@help_menu.add('command',
						'label'     => "Program Information",
						'command'   => Proc.new {@controller.program_information_method},
						'underline' => 0)
			@help_menu.add('command',
						'label'     => "Program License",
						'command'   => Proc.new {@controller.program_license_method},
						'underline' => 0)
		end

		def build_main
			frame_main = TkFrame.new(@root) {
				relief 'sunken'
				background $SNOW_WHITE
				pack('fill'=>'both', 'expand'=>'1', 'anchor' => 'n')
			}

			label_instructions = TkLabel.new(frame_main) do
				background $SNOW_WHITE
				text "Location field, browse to autofill"
				pack("pady"=> 20, "anchor"=>"n")
			end

			frame_link = TkFrame.new(frame_main) {
				background $SNOW_WHITE
				pack()
			}

			label_link = TkLabel.new(frame_link) do
				background $SNOW_WHITE
				text "Location"
				pack("side"=>"left")
			end

			# Elements are added to the stack in reverse order, this is the right stack
			button_link = TkButton.new(frame_link) do
				text "Browse"
				pack("side"=>"right")
			end
			# Command has to be added after because the controller object loses scope
			button_link.command = Proc.new {@controller.browse_method}

			@entry_link = TkEntry.new(frame_link) do
				background $SNOW_WHITE
				width 50
				pack("side"=>"right")
			end

			# View Status Label, so the user can see that happened
			@label_status = TkLabel.new(frame_main) do
				background $SNOW_WHITE
				text ""
				foreground $RED
				pack("pady"=> 10)
			end
		end

		def build_status
			frame_status_bar = TkFrame.new(@root) {
				background $GUN_METAL
				relief 'sunken'
				borderwidth 2
				highlightbackground "black"
				pack('fill'=>'x', 'anchor' => 's')
			}

			label_version = TkLabel.new(frame_status_bar) do
				background $GUN_METAL
				foreground $WHITE
				text "Version: #{$software_version}"
				pack("side"=>"left")
			end

			label_status = TkLabel.new(frame_status_bar) do
				background $GUN_METAL
				foreground $WHITE
				text ""
				pack("side"=>"left", 'expand'=>'1')
			end

			label_brand = TkLabel.new(frame_status_bar) do
				background $GUN_METAL
				foreground $WHITE
				text $company
				pack("side"=>"right")
			end
		end
end