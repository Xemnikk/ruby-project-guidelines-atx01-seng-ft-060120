class Main

require './lib/User.rb'
# song = Music.new('./music.wav')
# song.loop = true
# song.play

# # def play_music 
# #     @song.play
# #     @song.loop = true
# # end
# # play_music

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
    @@current_user = User.set_name
#multiple choice select
    begin_word
    #This is where the game loop should start.
    @@branch_place = Game.start_game

    @prompt.say("The year is blah blah blah.")
    sleep(5)
    choices = %w(Right Left Back Forward) # Need to add Save for each choice iteration. 
    @prompt.select("Where will you go?", Right, Left, Onward)

   #Game.Branch_progress
end


def load_save
    load_save_word
    puts "filler" #This should allow User to see previous save_instances and load whichever one the User chooses.
end

def brave_allies
    brave_allies_word
    puts "filler" #This should allow the User to see all save_instances for all Users and where they are in the Game. 
end

def rate
    rate_word
    puts 'filler' #This should allow the User to leave a rating for the team developing the game to recommend additions to the game. 
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


# collect answers
# result = prompt.collect do
#     key(:name).ask('Who are you?')
# end

# if NewGame then
#     prompt.ask('What is your chosen name?', default: ENV['USER'])
#     prompt.mask("What is your password")
# elsif LoadSave then
#     prompt.ask('What is your username?', default: ENV['USER'])
#     prompt.mask("What is your password")
# elsif ViewChoices then
#     #show leaderboard
# else 
#     #run exit script
# end
end