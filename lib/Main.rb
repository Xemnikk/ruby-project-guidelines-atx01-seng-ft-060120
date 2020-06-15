puts "
███████╗ ██████╗ ██████╗  ██████╗███████╗██████╗ ███████╗██████╗ 
██╔════╝██╔═══██╗██╔══██╗██╔════╝██╔════╝██╔══██╗██╔════╝██╔══██╗
███████╗██║   ██║██████╔╝██║     █████╗  ██████╔╝█████╗  ██████╔╝
╚════██║██║   ██║██╔══██╗██║     ██╔══╝  ██╔══██╗██╔══╝  ██╔══██╗
███████║╚██████╔╝██║  ██║╚██████╗███████╗██║  ██║███████╗██║  ██║
╚══════╝ ╚═════╝ ╚═╝  ╚═╝ ╚═════╝╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝".colorize(:blue)

prompt = TTY::Prompt.new
prompt.select("Choose your destiny?", %w(NewGame LoadSave ViewChoices Exit))
prompt.ask('What is your chosen name?', default: ENV['USER'])
prompt.mask("What is your password")