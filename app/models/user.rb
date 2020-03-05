class User < ActiveRecord::Base 
    has_secure_password

    validates :email, :presence => true
    #uniqueness? Validate please. AR Validation can be used for this. 
    
    has_many :posts
end 