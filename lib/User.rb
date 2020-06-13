class User < ActiveRecord::Base

    has_many :saves
    has_many games, through: : saves

end