class Post < ActiveRecord::Base
    belongs_to :user

    def self.avg_tact_rating
        total_tact = Post.all.reduce(0) do |sum, post|
            sum + post.tact_rating.to_i
        end
        num_of_tact = Post.all.length
        total_tact / num_of_tact
    end
end 