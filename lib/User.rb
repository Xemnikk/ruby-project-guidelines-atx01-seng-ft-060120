class User < ActiveRecord::Base

    PROMPT = TTY::Prompt.new

    has_many :saves
    has_many :games, through: :saves

    def self.create_user
        new_user = User.get_username
        new_user.password = User.set_password
        new_user.save
        new_user
    end

    def self.get_username
        given_username = PROMPT.ask('What is your chosen name?', required: true)
        confirm_username = PROMPT.yes?("So I should call you #{given_username}? Is that right?")
        if confirm_username
            if User.find_by(username: given_username) == nil
                User.create(username: given_username)
            else
                puts "It would seem there is another by the name #{given_username}. Coincidence, or Fate? Please choose another, brave hero."
                self.get_username
            end
        else
            self.get_username
        end
    end

    def self.set_password
        given_password = PROMPT.mask("Enter your password.", required: true) do |q|
        q.validate(/^(?=.*[a-zA-Z])(?=.*[0-9]).{6,}$/)
        q.messages[:valid?] = 'Your password must be at least 6 characters and include one number and one letter.'
        end
        confirm_password = PROMPT.mask("Please confirm your password", required: true)
        if given_password == confirm_password
            given_password
        else
            puts "Looks like your passwords do not match, adventurer. Please try again."
                self.set_password
            end
        end

        def self.set_name
            given_name = PROMPT.ask("What will you call this iteration?", required: true) 
            confirm_name = PROMPT.yes?("So, you will go with #{given_name} this time? Interesting.")
            if confirm_name 
                if User.find_by(display_name: given_name) == nil
                    User.create(display_name: given_name)
                else
                    puts "You already own this iteration of the story. Please try again."
                    self.set_name
                end
            end
        end

end