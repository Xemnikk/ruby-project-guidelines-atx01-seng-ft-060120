class Save < ActiveRecord::Base

    PROMPT = TTY::Prompt.new

    belongs_to :game
    belongs_to :user

    def self.set_save
        given_save = PROMPT.ask("What will you call this iteration?", required: true) 
        confirm_save = PROMPT.yes?("So, you will go with #{given_save} this time? Interesting.")
        if confirm_save 
            if Save.find_by(name: given_save) == nil
                Save.create(name: given_save)
            else
                puts "You already own this iteration of the story. Please try again."
                self.set_save
            end
        end
    end

    def save 
        given_save = PROMPT.yes?("Are you sure you wish to save your progress?", required: true) 
        confirm_save = PROMPT.yes?("Fine, then #{given_save} will be updated.")
    end

    def self.load
        given_save = PROMPT.ask("What is the name of the save you wish to load?", required: true)
        confirm_save = PROMPT.yes?("Will you go with #{given_save}?")
        if confirm_save
            Save.find_by(name: given_save)
        end
    end


end