# Set application wide variables
$company = "company name"
$company_link = "website link"
$software_version = "0.0.0"
$release_date = "YYYY-MM-DD"
$application_name = "application name"
$application_root = Dir.pwd # This assumes you are running this application from the start.sh/cmd
$application_icon = "#{$application_root}/assets/image/desktop_logo_50.png"
$program_information = "Ruby desktop application using TK"
$program_license = "
	BSD 4-Clause License

	Copyright (c) 2021, Nate Tachibana
	All rights reserved.

	Redistribution and use in source and binary forms, with or without
	modification, are permitted provided that the following conditions are met:

	1. Redistributions of source code must retain the above copyright notice, this
	list of conditions and the following disclaimer.

	2. Redistributions in binary form must reproduce the above copyright notice,
	this list of conditions and the following disclaimer in the documentation
	and/or other materials provided with the distribution.

	3. All advertising materials mentioning features or use of this software must
	display the following acknowledgement: This product includes software
	developed by Nate Tachibana.

	4. Neither the name of Nate Tachibana nor the names of its contributors
	may be used to endorse or promote products derived from this software without
	specific prior written permission.

	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS \"AS IS\"
	AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
	IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
	DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
	FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
	DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
	SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
	CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
	OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
	OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
"

# Required ruby code
require "#{$application_root}/lib/library_index.rb"
require "#{$application_root}/app/controller/main_controller.rb"

# Running the pre-GUI application checks
startup_checks

# Start Main application
program = MainController.new
program.start_application