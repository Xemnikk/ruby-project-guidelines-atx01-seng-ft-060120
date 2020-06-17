class Game < ActiveRecord::Base

    has_many :saves
    has_many :users, through: :saves

    def game_hash
        
            Start_game = { 
                :LeftBranch =>{:LB=>[{ ZeroLB:"", OneLb:"", TwoLB:"",ThreeLB:"",FourLB:"",FiveLB:"",SixLB:"",EndR:""}]},
                :LCon=>[]
                },

                :MiddleBranch =>{},

                :RightBranch =>{:RB=>[{ ZeroRB:"", OneRb:"", TwoRB:"",ThreeRB:"",FourRB:"",FiveRB:"",SixRB:"",EndR:""}]},
                :RCon=>[]}
            }
        

end