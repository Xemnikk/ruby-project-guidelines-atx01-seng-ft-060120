class Main

require './lib/User.rb'
require './lib/Save.rb'
require './lib/Game.rb'
song = Music.new('./music.wav')
song.loop = true
song.play

intro_word

@prompt = TTY::Prompt.new

def self.find_user
    find_user = @prompt.ask("what is your chosen name?", required: true)
    @@current_user = User.find_by(username: find_user)
    if @@current_user == nil
        puts "I couldn't find you."
        puts "Please try again."
        self.login
    end
end

def self.enter_password
    enter_password = @prompt.mask('password:', echo: true, required: true)
    if enter_password == @@current_user.password
        @@current_user
    else
        puts "That is not the password you chose."
        puts "Please try again!"
        self.enter_password
    end
end




def self.new_game
    new_game_word
    @@current_save = Save.set_save
#multiple choice select
    begin_word
    #This is where the game loop should start.
   # @@branch_place = Game.start_game
   #@@branch_place = Game.new

    @prompt.say("A young Wizard stands before their greatest trial yet, A dungeon crawl filled with puzzles, traps and dead ends. Their prize? A passing grade.
    The young Wizard enters the dungeon, and the door melts away behind them before them stands two options.
    Left? There are scratches in the stone floor leading up to a bolted iron door 
    or
    Right? A worn out wooden door with water seeping from underneath it.")

    @@branch_place = Game.start_game

   #Game.Branch_progress
end


def self.load_save
    load_save_word
    find_save = @prompt.ask("Which save would you like me to load?", required: true)
    @@current_save = Save.find_by(name: find_save)
    if @@current_save == nil 
        puts "Sorry, I couldn't find that save."
        puts "Please try again."
        self.run
    end
end

def self.brave_allies
    brave_allies_word
    Save.all
end

def self.rate
    rate_word
    useful_data = @prompt.ask("Please write whatever you wish to say here")
    useful_data 
end


def self.run 
menu_choice = @prompt.select("Choose your destiny?") do |menu|
    menu.choice 'NewGame'
    menu.choice 'LoadSave'
    menu.choice 'BraveAllies'
    menu.choice 'Rate'
    menu.choice 'Exit'
end

if menu_choice == 'NewGame'
    new_game
elsif menu_choice == 'LoadSave'
    load_save
elsif menu_choice == 'BraveAllies'
    brave_allies
elsif menu_choice == 'Rate'
    rate 
else 
    exit_word
    end
end

def self.login
    choices = %w(Login Exit)
    login_or_exit = @prompt.select("", choices)
    case login_or_exit
    when "Login"
        self.find_user
        self.enter_password
    when "Exit"
        exit
    end
end

def self.greet_user
    answer = @prompt.yes?("Are you a new user?")
    if answer
        @@current_user = User.create_user
        self.run
    else
        self.login
        self.run
    end
end

self.greet_user

end