class Group < ApplicationRecord
 has_many :events, dependent: :destroy
 has_many :customers
 
 validates :owner_id, presence: true, uniqueness: true
 
 def self.looks(search, word)
    if search == "perfect_match"
      @group = Group.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @group= Group.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @group = Group.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @group = Group.where("name LIKE?","%#{word}%")
    else
     @group = Group.all
    end
 end
end
