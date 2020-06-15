class User < ActiveRecord::Base

    has_many :saves
    has_many :games, through: :saves

    def self.create_user
        new_user = User.get_username
        new_user.password = User.set_password
        new_user.save
        new_user
    end

    def self.get_username
        given_username = prompt.ask('What is your chosen name?', required: true)
        confirm_username = prompt.yes?('So I should call you #{given_username}? Is that right?')
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
end