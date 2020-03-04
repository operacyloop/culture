class AddTactRatingToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :timeliness, :integer 
    add_column :posts, :selfreliance, :integer
    add_column :posts, :dependability, :integer
    add_column :posts, :courage, :integer
    add_column :posts, :honesty, :integer
    add_column :posts, :tact, :integer
    add_column :posts, :workethic, :integer
    add_column :posts, :charm, :integer
    add_column :posts, :senseofhumor, :integer
    add_column :posts, :fun_to_be_around, :integer
    add_column :posts, :trustworthiness, :integer
    add_column :posts, :selfconfidence, :integer
    add_column :posts, :smarter_not_harder, :integer
    add_column :posts, :help_others, :integer
    add_column :posts, :getsalong, :integer
    add_column :posts, :considerate, :integer
    add_column :posts, :confront, :integer
    add_column :posts, :acceptance, :integer
    add_column :posts, :take_responsibility, :integer
    add_column :posts, :self_understanding, :integer
    dd_column :posts, :self_improvement, :integer
  end
end
