class Game < ActiveRecord::Base

    PROMPT = TTY::Prompt.new

    has_many :saves
    has_many :users, through: :saves

    def self.game_hash
        
            start_game = {
                
                :left_branch =>{
                        ZeroLB:"You walk to the Iron door and pull it open. Echoing down the hallway are faint scraping sounds. As you step through the Iron door closes behind you. The Quest has started.",
                        OneLB:"Follow the sounds- You come across another fork in the hallway. The opening on the left is covered by fallen rocks, but you can still go straight, where you hear an ongoing fight. To the right the hallway seems to shift and writhe the longer you stare at it. Go Right?", 
                        TwoLB:"“Follow the lights” the hallway starts to narrow and spiral until you are picking your way up a narrow, crumbling spiral staircase. One of the stones in the wall shifts as you pass, behind it you can see a large dark room. More stones shift, and through the makeshift doorway that appears you see a glowing pair of eyes stare at you before backing away into the darkness. Do you approach hole to your right?",
                        ThreeLB:"the hallways are lines with suits of armour, and they reflect the warm light of the torches. There is a wide hole in the wall near the ceiling, something beckons you toward the lightless void within, and as you draw nearer, the sounds you have been following since the beginning start to fade away. The armour-stand in front of the opening shows the reflection of a silvery pair of eyes. Do you turn right? ",
                        FourLB:"The Noises of a fight are louder now, you can make out voices and animalistic screams as something up ahead battles your predecessors. As you rush forward, you almost miss a small doorway tucked around a corner. There is no door, and through it there is faint and flickering fire light, and the smell of salt and sea water reaches you. Go right?",
                        EndLB:"This is your destination.  Before you is a heavy iron gate. The sounds of fighting stop as you approach and the gate swings open at your touch. Ready yourself young Wizard, this is the fight you must win…… it is done. The test of Strength, Wits and Skill is complete."
                        },

                :middle_branch =>{
                        OneMB:"You enter the Pitch black hallway,and start to feel your way through the hallway. While waiting for your eyes to adjust, you realise that, at the edge of your vision you can see something moving ahead of you.", 
                        TwoMB:"There are two points of light ahead of you. As you draw near you see that something has broken through the walls the hole on your left leads to a narrow spiral staircase, and to the right is a room with water dripping from the ceiling. The hallway continues on into a familiar darkness. The things on the ceiling watch you, waiting for you to decide. Left or Right",
                        ThreeMB:"There is a drop off to the left, and if you peer through it you can just make out a suit of armour. There is another branching path to the right and you faintly hear the sound of wind chimes. Ahead of you is a black door painted to look like an open mouth. Where do you go? Left or Right?",
                        EndMB:"This is your final test. Do you have the strength to push forward? Are you aware of what you have to face? the mouth gapes wider and you step trough...... It is done. The test of Courage, Wisdom and Resolve is complete"
                    },

                :right_branch =>{
                            OneRB:"You push open the door, and your shoes get soaked in clear water. The room you enter is lined with old,smooth wood, and leads you into a corridor lined with paintings of landscapes with large,blurry figures in the background. The water drains away as you enter the hallway.
                            ", 
                            TwoRB:"The old wooden floors start to slope upwards and you see an opening in the wood paneled walls to your left. There is a rustling noise and you see shapes moving in the darkness. Go left?
                            ",
                            ThreeRB:"The smooth wood floors start to soften under your feet, and water begins to drip down faded walls, to your left is a door with a bright light shining through the crack in the bottom, Continue onwards? Or go left?",
                            EndRB:"This is the end of your path, infront of you is a glass door, through wich you can see water and and marine life. will you step through?....... It is done. the test of Curiosity, Wonder and int "
                        }
            }
    end




        
    
     
      
        
      


    def self.start_game

        menu_choices = PROMPT.select("Which way will you go?") do |t|
            t.choice 'Right'
            t.choice 'Left'
            t.choice 'Onward'
            t.choice 'Save'
            t.choice 'Exit'
        end

        if menu_choices == 'Right'
            puts (Game.game_hash[:right_branch][:OneRB])
            sleep(5)

            yeet = PROMPT.ask("Will you continue?", required: true)
            if yeet == "yes"
            puts (Game.game_hash[:right_branch][:TwoRB])
            else 
                exit_word
                exit
            end
            sleep(5)

            yah = PROMPT.ask("Will you continue?", required: true)
            if yah == "yes"
            puts (Game.game_hash[:right_branch][:ThreeRB])
            else
                exit_word
                exit
            end
            sleep(5)

            hey = PROMPT.ask("Will you continue?", required: true)
            if hey == "yes"
            puts (Game.game_hash[:right_branch][:EndRB])
            else
                exit_word
                exit
            end
            sleep(5)
            congrats_word

        elsif menu_choices == 'Left'
            puts (Game.game_hash[:left_branch][:ZeroLB])
            sleep(5)

            yeet = PROMPT.ask("Will you continue?", required: true)
            if yeet == "yes"
            puts (Game.game_hash[:left_branch][:OneLB])
            else 
                exit_word
                exit
            end
            sleep(5)

            yah = PROMPT.ask("Will you continue?", required: true)
            if yah == "yes"
            puts (Game.game_hash[:left_branch][:TwoLB])
            else
                exit_word
                exit
            end
            sleep(5)

            hey = PROMPT.ask("Will you continue?", required: true)
            if hey == "yes"
            puts (Game.game_hash[:left_branch][:ThreeLB])
            else 
                exit_word
                exit
            end
            sleep(5)

            lop = PROMPT.ask("Will you continue?", required: true)
            if lop == "yes"
            puts (Game.game_hash[:left_branch][:FourLB])
            else 
                exit_word
                exit
            end
            sleep(5)

            kit = PROMPT.ask("Will you continue?", required: true)
            if kit == "yes"
            puts (Game.game_hash[:left_branch][:EndLB])
            else
                exit_word
                exit
            end
            sleep(5)
            congrats_word



        elsif menu_choices == 'Onward'
            puts (Game.game_hash[:middle_branch][:OneMB])
            sleep(5)

            yeet = PROMPT.ask("Will you continue?", required: true)
            if yeet == "yes"
            puts (Game.game_hash[:middle_branch][:TwoMB])
            else
                exit_word
                exit
            end
            sleep(5)

            yah = PROMPT.ask("Will you continue?", required: true)
            if yah == "yes"
            puts (Game.game_hash[:middle_branch][:ThreeMB])
            else
                exit_word
                exit
            end
            sleep(5)

            pop = PROMPT.ask("Will you continue?", required: true)
            if pop == "yes"
            puts (Game.game_hash[:middle_branch][:EndMB])
            else 
                exit_word
                exit
            end
            sleep(5)
            congrats_word

        elsif menu_choices == 'Save'
            @@current_save.save 

        else 
            exit_word
            exit

        end
 end

  




end

    # def self.branch_progess
    #     if Main.prompt == continues
    #        branch = start_game[save_branch].index += 1
    #        puts branch
    #     end

    #      if Main.prompt == right
    #         if branch start_game[save_branch] == :left_branch
    #             puts start_game[:middle_branch].index += 1
    #         else
    #             puts start_game[:right_branch].index += 1
    #         end
    #     end

    #     if Main.prompt == left
    #         if branch start_game[save_branch] == :middle_branch
    #             puts start_game[:left_branch].index += 1
    #         else
    #             puts start_game[:middle_branch].index += 1
    #         end
    #     end
    # end
