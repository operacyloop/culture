class User < ActiveRecord::Base 
    has_secure_password

    validates :mail, :presence => true
    
    has_many :posts
end 