class Game < ActiveRecord::Base

    has_many :saves
    has_many :users, through: :saves

    def game_hash
        
            Start_game = {
                
                :LeftBranch =>{
                    :LB=>[
                        { 
                        ZeroLB:"You walk to the Iron door and pull it open. Echoing down the hallway are faint scraping sounds. As you step through the Iron door closes behind you. The Quest has started.",
                        OneLb:"Follow the sounds- You come across another fork in the hallway. The opening on the left is covered by fallen rocks, but you can still go straight, where you hear an ongoing fight. To the right the hallway seems to shift and writhe the longer you stare at it.", 
                        TwoLB:"“Follow the lights” the hallway starts to narrow and spiral until you are picking your way up a narrow, crumbling spiral staircase. One of the stones in the wall shifts as you pass, behind it you can see a large dark room. More stones shift, and through the makeshift doorway that appears you see a glowing pair of eyes stare at you before backing away into the darkness. Do you approach hole to your right?",
                        ThreeLB:"the hallways are lines with suits of armour, and they reflect the warm light of the torches. There is a wide hole in the wall near the ceiling, something beckons you toward the lightless void within, and as you draw nearer, the sounds you have been following since the beginning start to fade away. The armour-stand in front of the opening shows the reflection of a silvery pair of eyes. Do you turn right? ",
                        FourLB:"The Noises of a fight are louder now, you can make out voices and animalistic screams as something up ahead battles your predecessors. As you rush forward, you almost miss a small doorway tucked around a corner. There is no door, and through it there is faint and flickering fire light, and the smell of salt and sea water reaches you. Go right?",
                        EndR:"This is your destination.  Before you is a heavy iron gate. The sounds of fighting stop as you approach and the gate swings open at your touch. Ready yourself young Wizard, this is the fight you must win…… it is done. The test of Strength, wits and skill is complete."
                            }]},

                :LCon=>{[
                    
                ]},
                

                :MiddleBranch =>{
                    :MB=>[
                    {
                        ZeroMB:"", 
                        OneMB:"", 
                        TwoMB:"",
                        ThreeMB:"",
                        EndM:""
                        }
                        ]
                    },
                :MCon=>{[

                ]}
            },

                :RightBranch =>{
                    :RB=>[
                        {
                            ZeroRB:"", 
                            OneRb:"", 
                            TwoRB:"",
                            ThreeRB:"",
                            FourRB:"",
                            FiveRB:"",
                            SixRB:"",
                            EndR:""
                            }
                            ]
                        },
                    :RCon=>{[

                    ]}
            }
    end
end